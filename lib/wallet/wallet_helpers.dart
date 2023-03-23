import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:pointycastle/key_derivators/api.dart';
import 'package:pointycastle/key_derivators/scrypt.dart';
import 'package:steel_crypt/steel_crypt.dart';
import 'package:wallet_dart/constants/constants.dart';
import 'package:wallet_dart/contracts/factories/SocialRecoveryModule.g.dart';
import 'package:wallet_dart/contracts/wallet.dart';
import 'package:wallet_dart/wallet/encode_function_data.dart';
import 'package:wallet_dart/wallet/wallet_instance.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/src/utils/length_tracking_byte_sink.dart';
import 'package:web3dart/web3dart.dart';



class WalletHelpers {

  static Future<String> _generatePasswordKey(Map args) async{
    final Scrypt scrypt = Scrypt();
    scrypt.init(ScryptParameters(16384, 8, 1, 32, base64Decode(args["salt"])));
    var passwordBytes = utf8.encode(args["password"]) as Uint8List;
    var keyBytes = scrypt.process(passwordBytes);
    return base64.encode(keyBytes);
  }

  static Future<String> _generatePasswordKeyThread(String password, String salt) async{
    var key = await compute(_generatePasswordKey, {'password': password, 'salt': salt});
    return key;
  }

  static Future<WalletInstance?> reEncryptSigner(WalletInstance wallet, String newPassword, String salt, {EthPrivateKey? credentials, String? password}) async{
    WalletInstance newInstance = WalletInstance.fromJson(wallet.toJson());
    Uint8List privateKeyBytes;
    if (credentials != null){
      privateKeyBytes = credentials.privateKey;
    }else{
      if (password == null) return null;
      var _credentials = await decryptSigner(wallet, password, salt);
      if (_credentials == null) return null;
      privateKeyBytes = (_credentials as EthPrivateKey).privateKey;
    }
    String newPasswordKey = await _generatePasswordKeyThread(newPassword, salt);
    AesCrypt aesCrypt = AesCrypt(padding: PaddingAES.pkcs7, key: newPasswordKey);
    newInstance.encryptedSigner = aesCrypt.cbc.encrypt(
        inp: bytesToHex(privateKeyBytes, include0x: true),
        iv: salt.toString(),
    ).toString();
    return newInstance;
  }

  static Future<Credentials?> decryptSigner(WalletInstance wallet, String password, String salt) async {
    try {
      String passwordKey = await _generatePasswordKeyThread(password, salt);
      AesCrypt aesCrypt = AesCrypt(padding: PaddingAES.pkcs7, key: passwordKey);
      String privateKey = aesCrypt.cbc.decrypt(enc: wallet.encryptedSigner, iv: salt.toString());
      var privateKeyBytes = hexToBytes(privateKey);
      if (privateKeyBytes.length > 32){
        int trim = privateKeyBytes.length - 32;
        privateKeyBytes = privateKeyBytes.sublist(trim);
      }
      return EthPrivateKey(privateKeyBytes);
    } catch (e) {
      return null;
    }
  }

  static Future<WalletInstance> createRecovery(String walletAddress, String moduleManagerAddress, String socialRecoveryAddress, String password, String salt) async{
    var rng = Random.secure();
    EthPrivateKey signer = EthPrivateKey.createRandom(rng);
    //
    String passwordKey = await _generatePasswordKeyThread(password, salt);
    AesCrypt aesCrypt = AesCrypt(padding: PaddingAES.pkcs7, key: passwordKey);
    //
    EthereumAddress initOwner = await signer.extractAddress();
    //
    return WalletInstance(
      walletAddress: EthereumAddress.fromHex(walletAddress),
      moduleManager: EthereumAddress.fromHex(moduleManagerAddress),
      socialRecovery: EthereumAddress.fromHex(socialRecoveryAddress),
      initOwner: initOwner.hex,
      initGuardians: [],
      salt: salt,
      encryptedSigner: aesCrypt.cbc.encrypt(
        inp: bytesToHex(signer.privateKey, include0x: true),
        iv: salt.toString()
      ).toString(),
    );
  }

  static Uint8List getInitCode(EthereumAddress safeAccountAddress,EthereumAddress ownerAddress,String salt){
    LengthTrackingByteSink sink = LengthTrackingByteSink();
    sink.add(hexToBytes(safeAccountAddress.toString()));
    sink.add(hexToBytes(EncodeFunctionData.createAccount(ownerAddress,_covertSalt(salt))));
    return sink.asBytes();
  }

  static BigInt _decodeBigInt(List<int> bytes) {
    var negative = bytes.isNotEmpty && bytes[0] & 0x80 == 0x80;

    BigInt result;

    if (bytes.length == 1) {
      result = BigInt.from(bytes[0]);
    } else {
      result = BigInt.zero;
      for (var i = 0; i < bytes.length; i++) {
        var item = bytes[bytes.length - i - 1];
        result |= (BigInt.from(item) << (8 * i));
      }
    }
    return result != BigInt.zero
        ? negative
            ? result.toSigned(result.bitLength)
            : result
        : BigInt.zero;
  }

  static Future<WalletInstance> createRandom(String password, String salt,EthereumAddress safeAccountAddress, [List<EthereumAddress> initGuardians = const []]) async{
    var rng = Random.secure();
    EthPrivateKey signer = EthPrivateKey.createRandom(rng);
    //
    String passwordKey = await _generatePasswordKeyThread(password, salt);
    AesCrypt aesCrypt = AesCrypt(padding: PaddingAES.pkcs7, key: passwordKey);
    //
    EthereumAddress initOwner = await signer.extractAddress();
    //
    EthereumAddress moduleManager = EthereumAddress.fromHex(getWalletManagerAddress());
    EthereumAddress socialRecovery = EthereumAddress.fromHex(getSocialRecoveryAddress(salt));
    //
    EthereumAddress walletAddress = await getWalletAddress(safeAccountAddress, initOwner, salt);
    return WalletInstance(
      walletAddress: walletAddress,
      moduleManager: moduleManager,
      socialRecovery: socialRecovery,
      initOwner: initOwner.hexEip55,
      initGuardians: initGuardians,
      salt: salt,
      encryptedSigner: aesCrypt.cbc.encrypt(
        inp: bytesToHex(signer.privateKey, include0x: true),
        iv: salt.toString(),
      ).toString(),
    );
  }

  static BigInt _covertSalt(String salt){
    int n = ByteData.view(base64Decode(salt).buffer).getInt16(0);
    print("salt:$n");
    return BigInt.from(n);
  }

  static Future<EthereumAddress> getWalletAddress(EthereumAddress safeAccountAddress,EthereumAddress owner,String salt) async{
    return await CWallet.gnosisSafeAccount(safeAccountAddress).getAddress(owner, _covertSalt(salt));
  }

  static String getWalletManagerAddress(){
    // Uint8List salt = keccak256(Uint8List.fromList("${_salt}_moduleManager".codeUnits));
    // return _WalletHelperUtils.getCreate2Address(
    //   Constants.singletonFactoryAddress,
    //   salt,
    //   keccak256(getManagerInitCode()),
    // );
    return "0x3855446f2253291f6c75bb67CcD9EC1318A2440D";
  }

  static String getSocialRecoveryAddress(String _salt){
    Uint8List salt = keccak256(Uint8List.fromList("${_salt}_socialRecovery".codeUnits));
    return _WalletHelperUtils.getCreate2Address(
      Constants.singletonFactoryAddress,
      salt,
      keccak256(getSocialRecoveryInitCode()),
    );
  }

  static Uint8List getSocialRecoveryInitCode(){
    LengthTrackingByteSink sink = LengthTrackingByteSink();
    sink.add(SocialRecoveryModule.byteCode);
    return sink.asBytes();
  }
}


class _WalletHelperUtils {

  static getCreate2Address(EthereumAddress from, Uint8List salt, Uint8List initCodeHash){
    Uint8List ff = hexToBytes("0xff");
    String address = _getChecksumAddress(from.hex);
    LengthTrackingByteSink sink = LengthTrackingByteSink();
    //
    sink.add(ff);
    sink.add(hexToBytes(address));
    sink.add(salt);
    sink.add(initCodeHash);
    //
    return _getChecksumAddress(bytesToHex(keccak256(sink.asBytes()), include0x: true).substring(12*2)); // equivalent to hexDataSlice in ethers (12 bytes * 2 (bytes length in hex))
  }

  static String _getChecksumAddress(String address){
    address = address.toLowerCase();
    var chars = address.substring(2).split("");
    var expanded = Uint8List(40);
    for (int i = 0; i < 40; i++) {
      expanded[i] = chars[i].codeUnitAt(0);
    }
    var hashed = keccak256(expanded);
    for (int i = 0; i < 40; i += 2) {
      if ((hashed[i >> 1] >> 4) >= 8) {
        chars[i] = chars[i].toUpperCase();
      }
      if ((hashed[i >> 1] & 0x0f) >= 8) {
        chars[i + 1] = chars[i + 1].toUpperCase();
      }
    }
    return "0x" + chars.join("");
  }
}
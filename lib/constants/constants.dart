import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

class Constants {
  static Web3Client web3client = Web3Client("https://goerli.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161", Client());
  static Web3Client brownieClient = Web3Client("http://127.0.0.1:8545", Client());
  static BigInt defaultUnlockDelaySeconds = BigInt.from(172800);
  static EthereumAddress singletonFactoryAddress = EthereumAddress.fromHex("0x306E08a8041c5268f1C66d39fCc812D59FB74832");
  static EthereumAddress zeroAddress = EthereumAddress.fromHex("0x0000000000000000000000000000000000000000");
}
import 'package:wallet_dart/constants/constants.dart';
import 'package:wallet_dart/contracts/factories/EntryPoint.g.dart';
import 'package:web3dart/web3dart.dart';

class CEntrypoint {
  static EthereumAddress address = EthereumAddress.fromHex("0x6579B5B8c9CC793A9b5611B87B06CdFE7C769729");

  static EntryPoint interface = EntryPoint(address: address, client: Constants.web3client);

}

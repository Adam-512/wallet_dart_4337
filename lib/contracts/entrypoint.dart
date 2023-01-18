import 'package:wallet_dart/constants/constants.dart';
import 'package:wallet_dart/contracts/factories/EntryPoint.g.dart';
import 'package:web3dart/web3dart.dart';

class CEntrypoint {
  static EthereumAddress address = EthereumAddress.fromHex("0x6F31210360f075D92D49CE048Ec3799645f69a72");

  static EntryPoint interface = EntryPoint(address: address, client: Constants.web3client);

}

import 'package:wallet_dart/constants/constants.dart';
import 'package:wallet_dart/contracts/factories/EntryPoint.g.dart';
import 'package:web3dart/web3dart.dart';

class CEntrypoint {
  static EthereumAddress address = EthereumAddress.fromHex("0x0576a174D229E3cFA37253523E645A78A0C91B57");

  static EntryPoint interface = EntryPoint(address: address, client: Constants.web3client);

}

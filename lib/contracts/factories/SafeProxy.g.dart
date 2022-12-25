// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:typed_data';

import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart' as _i1;

final _contractAbi = _i1.ContractAbi.fromJson(
    '[{"inputs":[{"internalType":"address","name":"singleton","type":"address"},{"internalType":"contract EIP4337Manager","name":"aaModule","type":"address"},{"internalType":"address","name":"owner","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"stateMutability":"payable","type":"fallback"}]',
    'SafeProxy');

class SafeProxy extends _i1.GeneratedContract {

  static Uint8List byteCode = hexToBytes("0x608060405234801561001057600080fd5b506040516103e53803806103e583398101604081905261002f916101fb565b826001600160a01b0381166100965760405162461bcd60e51b815260206004820152602260248201527f496e76616c69642073696e676c65746f6e20616464726573732070726f766964604482015261195960f21b60648201526084015b60405180910390fd5b600080546001600160a01b0319166001600160a01b0392909216919091178155604080516001808252818301909252906020808301908036833701905050905081816000815181106100ea576100ea610248565b60200260200101906001600160a01b031690816001600160a01b031681525050600080846001600160a01b0316633251a95760e01b8787866040516024016101349392919061025e565b60408051601f198184030181529181526020820180516001600160e01b03166001600160e01b0319909416939093179092529051610172919061030c565b600060405180830381855af49150503d80600081146101ad576040519150601f19603f3d011682016040523d82523d6000602084013e6101b2565b606091505b50915091508181906101d75760405162461bcd60e51b815260040161008d9190610328565b5050505050505061035b565b6001600160a01b03811681146101f857600080fd5b50565b60008060006060848603121561021057600080fd5b835161021b816101e3565b602085015190935061022c816101e3565b604085015190925061023d816101e3565b809150509250925092565b634e487b7160e01b600052603260045260246000fd5b60006080820160018060a01b0380871684526020818716818601526080604086015282865180855260a087019150828801945060005b818110156102b2578551851683529483019491830191600101610294565b505085810360608701526002815261060f60f31b8282015260408101945050505050949350505050565b60005b838110156102f75781810151838201526020016102df565b83811115610306576000848401525b50505050565b6000825161031e8184602087016102dc565b9190910192915050565b60208152600082518060208401526103478160408501602087016102dc565b601f01601f19169190910160400192915050565b607c806103696000396000f3fe6080604052600080546001600160a01b0316813563530ca43760e11b1415602857808252602082f35b3682833781823684845af490503d82833e806041573d82fd5b503d81f3fea2646970667358221220a342a6878d5ef25ed50e32ba4b2717d4b31ddf30bd26d2600e08bdbe740a82ea64736f6c634300080c0033");

  SafeProxy(
      {required _i1.EthereumAddress address,
      required _i1.Web3Client client,
      int? chainId})
      : super(_i1.DeployedContract(_contractAbi, address), client, chainId);
}

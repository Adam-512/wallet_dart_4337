// Generated code, do not modify. Run `build_runner build` to re-generate!
// @dart=2.12
// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:web3dart/web3dart.dart' as _i1;
import 'dart:typed_data' as _i2;

final _contractAbi = _i1.ContractAbi.fromJson(
  '[{"inputs":[{"internalType":"address","name":"_gasReceiver","type":"address"}],"stateMutability":"nonpayable","type":"constructor"},{"inputs":[{"internalType":"uint256","name":"gasUsed","type":"uint256"}],"name":"SimulateDoRecovery","type":"error"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"wallet","type":"address"},{"indexed":false,"internalType":"address","name":"guardian","type":"address"},{"indexed":false,"internalType":"uint256","name":"threshold","type":"uint256"}],"name":"AddGuardian","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"wallet","type":"address"},{"indexed":false,"internalType":"address[]","name":"guardians","type":"address[]"},{"indexed":false,"internalType":"uint256","name":"threshold","type":"uint256"}],"name":"AddGuardians","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"wallet","type":"address"},{"indexed":false,"internalType":"uint256","name":"threshold","type":"uint256"}],"name":"ChangeThreshold","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"wallet","type":"address"},{"indexed":false,"internalType":"address","name":"newOwner","type":"address"},{"indexed":false,"internalType":"address","name":"payGasToken","type":"address"},{"indexed":false,"internalType":"uint256","name":"payGasAmount","type":"uint256"}],"name":"DoRecovery","type":"event"},{"anonymous":false,"inputs":[{"indexed":true,"internalType":"address","name":"previousOwner","type":"address"},{"indexed":true,"internalType":"address","name":"newOwner","type":"address"}],"name":"OwnershipTransferred","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"wallet","type":"address"},{"indexed":false,"internalType":"uint256","name":"threshold","type":"uint256"},{"indexed":false,"internalType":"address[]","name":"guardians","type":"address[]"}],"name":"ResetRecovery","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"internalType":"address","name":"wallet","type":"address"},{"indexed":false,"internalType":"address","name":"guardian","type":"address"},{"indexed":false,"internalType":"uint256","name":"threshold","type":"uint256"}],"name":"RevokeGuardian","type":"event"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"},{"internalType":"address","name":"_guardian","type":"address"},{"internalType":"uint256","name":"_threshold","type":"uint256"}],"name":"addGuardian","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"},{"internalType":"address[]","name":"_guardians","type":"address[]"},{"internalType":"uint256","name":"_threshold","type":"uint256"}],"name":"addGuardians","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_newGasReceiver","type":"address"}],"name":"changeGasReceiver","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"},{"internalType":"uint256","name":"_threshold","type":"uint256"}],"name":"changeThreshold","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"},{"internalType":"address","name":"_newOwner","type":"address"},{"components":[{"internalType":"address","name":"signer","type":"address"},{"internalType":"bytes","name":"signature","type":"bytes"}],"internalType":"struct SocialRecoveryModule.SignatureData[]","name":"_signatureData","type":"tuple[]"},{"components":[{"internalType":"address","name":"payGasToken","type":"address"},{"internalType":"uint256","name":"payGasAmount","type":"uint256"}],"internalType":"struct SocialRecoveryModule.PayGasData","name":"_payGasData","type":"tuple"}],"name":"doRecovery","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"},{"internalType":"address","name":"_newOwner","type":"address"},{"internalType":"uint256","name":"_nonce","type":"uint256"},{"components":[{"internalType":"address","name":"payGasToken","type":"address"},{"internalType":"uint256","name":"payGasAmount","type":"uint256"}],"internalType":"struct SocialRecoveryModule.PayGasData","name":"_payGasData","type":"tuple"}],"name":"encodeRecoveryData","outputs":[{"internalType":"bytes32","name":"","type":"bytes32"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"gasReceiver","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"getChainId","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"}],"name":"getGuardians","outputs":[{"internalType":"address[]","name":"","type":"address[]"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"}],"name":"guardiansCount","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"},{"internalType":"address","name":"_guardian","type":"address"}],"name":"isGuardian","outputs":[{"internalType":"bool","name":"","type":"bool"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"owner","outputs":[{"internalType":"address","name":"","type":"address"}],"stateMutability":"view","type":"function"},{"inputs":[],"name":"renounceOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"},{"internalType":"uint256","name":"_threshold","type":"uint256"},{"internalType":"address[]","name":"_orderedGuardianWallet","type":"address[]"}],"name":"resetGuardians","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"},{"internalType":"address","name":"_prevGuardian","type":"address"},{"internalType":"address","name":"_guardian","type":"address"},{"internalType":"uint256","name":"_threshold","type":"uint256"}],"name":"revokeGuardian","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"},{"internalType":"address","name":"_newOwner","type":"address"},{"components":[{"internalType":"address","name":"signer","type":"address"},{"internalType":"bytes","name":"signature","type":"bytes"}],"internalType":"struct SocialRecoveryModule.SignatureData[]","name":"_signatureData","type":"tuple[]"},{"components":[{"internalType":"address","name":"payGasToken","type":"address"},{"internalType":"uint256","name":"payGasAmount","type":"uint256"}],"internalType":"struct SocialRecoveryModule.PayGasData","name":"_payGasData","type":"tuple"}],"name":"simulateDoRecovery","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"_wallet","type":"address"}],"name":"threshold","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"},{"inputs":[{"internalType":"address","name":"newOwner","type":"address"}],"name":"transferOwnership","outputs":[],"stateMutability":"nonpayable","type":"function"},{"inputs":[{"internalType":"address","name":"","type":"address"}],"name":"walletsNonces","outputs":[{"internalType":"uint256","name":"","type":"uint256"}],"stateMutability":"view","type":"function"}]',
  'RecoveryModule',
);

class RecoveryModule extends _i1.GeneratedContract {
  RecoveryModule({
    required _i1.EthereumAddress address,
    required _i1.Web3Client client,
    int? chainId,
  }) : super(
          _i1.DeployedContract(
            _contractAbi,
            address,
          ),
          client,
          chainId,
        );

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addGuardian(
    _i1.EthereumAddress _wallet,
    _i1.EthereumAddress _guardian,
    BigInt _threshold, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[1];
    assert(checkSignature(function, '328c0bc2'));
    final params = [
      _wallet,
      _guardian,
      _threshold,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> addGuardians(
    _i1.EthereumAddress _wallet,
    List<_i1.EthereumAddress> _guardians,
    BigInt _threshold, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[2];
    assert(checkSignature(function, '4882af77'));
    final params = [
      _wallet,
      _guardians,
      _threshold,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> changeGasReceiver(
    _i1.EthereumAddress _newGasReceiver, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[3];
    assert(checkSignature(function, '256674a0'));
    final params = [_newGasReceiver];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> changeThreshold(
    _i1.EthereumAddress _wallet,
    BigInt _threshold, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[4];
    assert(checkSignature(function, '57cfebbc'));
    final params = [
      _wallet,
      _threshold,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> doRecovery(
    _i1.EthereumAddress _wallet,
    _i1.EthereumAddress _newOwner,
    List<dynamic> _signatureData,
    dynamic _payGasData, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[5];
    assert(checkSignature(function, 'dabf0fd3'));
    final params = [
      _wallet,
      _newOwner,
      _signatureData,
      _payGasData,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i2.Uint8List> encodeRecoveryData(
    _i1.EthereumAddress _wallet,
    _i1.EthereumAddress _newOwner,
    BigInt _nonce,
    dynamic _payGasData, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[6];
    assert(checkSignature(function, 'aef11269'));
    final params = [
      _wallet,
      _newOwner,
      _nonce,
      _payGasData,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i2.Uint8List);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> gasReceiver({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[7];
    assert(checkSignature(function, '80d14b4a'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> getChainId({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[8];
    assert(checkSignature(function, '3408e470'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<List<_i1.EthereumAddress>> getGuardians(
    _i1.EthereumAddress _wallet, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[9];
    assert(checkSignature(function, 'f18858ab'));
    final params = [_wallet];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as List<dynamic>).cast<_i1.EthereumAddress>();
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> guardiansCount(
    _i1.EthereumAddress _wallet, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[10];
    assert(checkSignature(function, 'c026e7ee'));
    final params = [_wallet];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<bool> isGuardian(
    _i1.EthereumAddress _wallet,
    _i1.EthereumAddress _guardian, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[11];
    assert(checkSignature(function, 'd4ee9734'));
    final params = [
      _wallet,
      _guardian,
    ];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as bool);
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<_i1.EthereumAddress> owner({_i1.BlockNum? atBlock}) async {
    final function = self.abi.functions[12];
    assert(checkSignature(function, '8da5cb5b'));
    final params = [];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as _i1.EthereumAddress);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> renounceOwnership({
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[13];
    assert(checkSignature(function, '715018a6'));
    final params = [];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> resetGuardians(
    _i1.EthereumAddress _wallet,
    BigInt _threshold,
    List<_i1.EthereumAddress> _orderedGuardianWallet, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[14];
    assert(checkSignature(function, '61c276e1'));
    final params = [
      _wallet,
      _threshold,
      _orderedGuardianWallet,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> revokeGuardian(
    _i1.EthereumAddress _wallet,
    _i1.EthereumAddress _prevGuardian,
    _i1.EthereumAddress _guardian,
    BigInt _threshold, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[15];
    assert(checkSignature(function, '60e67b43'));
    final params = [
      _wallet,
      _prevGuardian,
      _guardian,
      _threshold,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> simulateDoRecovery(
    _i1.EthereumAddress _wallet,
    _i1.EthereumAddress _newOwner,
    List<dynamic> _signatureData,
    dynamic _payGasData, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[16];
    assert(checkSignature(function, '7ffc0f90'));
    final params = [
      _wallet,
      _newOwner,
      _signatureData,
      _payGasData,
    ];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> threshold(
    _i1.EthereumAddress _wallet, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[17];
    assert(checkSignature(function, 'c86ec2bf'));
    final params = [_wallet];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// The optional [transaction] parameter can be used to override parameters
  /// like the gas price, nonce and max gas. The `data` and `to` fields will be
  /// set by the contract.
  Future<String> transferOwnership(
    _i1.EthereumAddress newOwner, {
    required _i1.Credentials credentials,
    _i1.Transaction? transaction,
  }) async {
    final function = self.abi.functions[18];
    assert(checkSignature(function, 'f2fde38b'));
    final params = [newOwner];
    return write(
      credentials,
      transaction,
      function,
      params,
    );
  }

  /// The optional [atBlock] parameter can be used to view historical data. When
  /// set, the function will be evaluated in the specified block. By default, the
  /// latest on-chain block will be used.
  Future<BigInt> walletsNonces(
    _i1.EthereumAddress $param34, {
    _i1.BlockNum? atBlock,
  }) async {
    final function = self.abi.functions[19];
    assert(checkSignature(function, '26b3716c'));
    final params = [$param34];
    final response = await read(
      function,
      params,
      atBlock,
    );
    return (response[0] as BigInt);
  }

  /// Returns a live stream of all AddGuardian events emitted by this contract.
  Stream<AddGuardian> addGuardianEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('AddGuardian');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return AddGuardian(decoded);
    });
  }

  /// Returns a live stream of all AddGuardians events emitted by this contract.
  Stream<AddGuardians> addGuardiansEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('AddGuardians');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return AddGuardians(decoded);
    });
  }

  /// Returns a live stream of all ChangeThreshold events emitted by this contract.
  Stream<ChangeThreshold> changeThresholdEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ChangeThreshold');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ChangeThreshold(decoded);
    });
  }

  /// Returns a live stream of all DoRecovery events emitted by this contract.
  Stream<DoRecovery> doRecoveryEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('DoRecovery');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return DoRecovery(decoded);
    });
  }

  /// Returns a live stream of all OwnershipTransferred events emitted by this contract.
  Stream<OwnershipTransferred> ownershipTransferredEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('OwnershipTransferred');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return OwnershipTransferred(decoded);
    });
  }

  /// Returns a live stream of all ResetRecovery events emitted by this contract.
  Stream<ResetRecovery> resetRecoveryEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('ResetRecovery');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return ResetRecovery(decoded);
    });
  }

  /// Returns a live stream of all RevokeGuardian events emitted by this contract.
  Stream<RevokeGuardian> revokeGuardianEvents({
    _i1.BlockNum? fromBlock,
    _i1.BlockNum? toBlock,
  }) {
    final event = self.event('RevokeGuardian');
    final filter = _i1.FilterOptions.events(
      contract: self,
      event: event,
      fromBlock: fromBlock,
      toBlock: toBlock,
    );
    return client.events(filter).map((_i1.FilterEvent result) {
      final decoded = event.decodeResults(
        result.topics!,
        result.data!,
      );
      return RevokeGuardian(decoded);
    });
  }
}

class AddGuardian {
  AddGuardian(List<dynamic> response)
      : wallet = (response[0] as _i1.EthereumAddress),
        guardian = (response[1] as _i1.EthereumAddress),
        threshold = (response[2] as BigInt);

  final _i1.EthereumAddress wallet;

  final _i1.EthereumAddress guardian;

  final BigInt threshold;
}

class AddGuardians {
  AddGuardians(List<dynamic> response)
      : wallet = (response[0] as _i1.EthereumAddress),
        guardians = (response[1] as List<dynamic>).cast<_i1.EthereumAddress>(),
        threshold = (response[2] as BigInt);

  final _i1.EthereumAddress wallet;

  final List<_i1.EthereumAddress> guardians;

  final BigInt threshold;
}

class ChangeThreshold {
  ChangeThreshold(List<dynamic> response)
      : wallet = (response[0] as _i1.EthereumAddress),
        threshold = (response[1] as BigInt);

  final _i1.EthereumAddress wallet;

  final BigInt threshold;
}

class DoRecovery {
  DoRecovery(List<dynamic> response)
      : wallet = (response[0] as _i1.EthereumAddress),
        newOwner = (response[1] as _i1.EthereumAddress),
        payGasToken = (response[2] as _i1.EthereumAddress),
        payGasAmount = (response[3] as BigInt);

  final _i1.EthereumAddress wallet;

  final _i1.EthereumAddress newOwner;

  final _i1.EthereumAddress payGasToken;

  final BigInt payGasAmount;
}

class OwnershipTransferred {
  OwnershipTransferred(List<dynamic> response)
      : previousOwner = (response[0] as _i1.EthereumAddress),
        newOwner = (response[1] as _i1.EthereumAddress);

  final _i1.EthereumAddress previousOwner;

  final _i1.EthereumAddress newOwner;
}

class ResetRecovery {
  ResetRecovery(List<dynamic> response)
      : wallet = (response[0] as _i1.EthereumAddress),
        threshold = (response[1] as BigInt),
        guardians = (response[2] as List<dynamic>).cast<_i1.EthereumAddress>();

  final _i1.EthereumAddress wallet;

  final BigInt threshold;

  final List<_i1.EthereumAddress> guardians;
}

class RevokeGuardian {
  RevokeGuardian(List<dynamic> response)
      : wallet = (response[0] as _i1.EthereumAddress),
        guardian = (response[1] as _i1.EthereumAddress),
        threshold = (response[2] as BigInt);

  final _i1.EthereumAddress wallet;

  final _i1.EthereumAddress guardian;

  final BigInt threshold;
}

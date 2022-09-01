import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voting_app/transaction_tester.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';

class WalletConnectEthereumCredentials extends CustomTransactionSender {
  WalletConnectEthereumCredentials({required this.provider});

  final EthereumWalletConnectProvider provider;

  @override
  Future<EthereumAddress> extractAddress() {
    throw UnimplementedError();
  }

  @override
  Future<String> sendTransaction(Transaction transaction) async {
    final hash = await provider.sendTransaction(
      from: transaction.from!.hex,
      to: transaction.to?.hex,
      data: transaction.data,
      gas: transaction.maxGas,
      gasPrice: transaction.gasPrice?.getInWei,
      value: transaction.value?.getInWei,
      nonce: transaction.nonce,
    );

    return hash;
  }

  @override
  Future<MsgSignature> signToSignature(Uint8List payload,
      {int? chainId, bool isEIP1559 = false}) {
    throw UnimplementedError();
  }
}

class EthereumTransactionTester extends TransactionTester {
  final Web3Client ethereum;
  final EthereumWalletConnectProvider provider;

  EthereumTransactionTester._internal({
    required WalletConnect connector,
    required this.ethereum,
    required this.provider,
  }) : super(connector: connector);

  factory EthereumTransactionTester() {
    final ethereum = Web3Client('https://ropsten.infura.io/', Client());

    final connector = WalletConnect(
      bridge: 'https://bridge.walletconnect.org',
      clientMeta: const PeerMeta(
        name: 'WalletConnect',
        description: 'WalletConnect Developer App',
        url: 'https://walletconnect.org',
        icons: [
          'https://gblobscdn.gitbook.com/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
        ],
      ),
    );

    final provider = EthereumWalletConnectProvider(connector);

    return EthereumTransactionTester._internal(
      connector: connector,
      ethereum: ethereum,
      provider: provider,
    );
  }

  @override
  Future<SessionStatus> connect({OnDisplayUriCallback? onDisplayUri}) async {
    var session = await connector.createSession(
        chainId: 4,
        onDisplayUri: (uri) async {
          await launchUrl(Uri.parse(uri), mode: LaunchMode.externalApplication);
        });

    print(session.accounts[0]);
    print(session.chainId);

    return session;
  }

  @override
  Future<void> disconnect() async {
    await connector.killSession();
  }

  @override
  Future<String> signTransaction(SessionStatus session) async {
    print("object");
    final sender = EthereumAddress.fromHex(session.accounts[0]);

    final transaction = Transaction(
      to: sender,
      from: sender,
      gasPrice: EtherAmount.inWei(BigInt.from(50401)),
      maxGas: 100000,
      value: EtherAmount.fromUnitAndValue(EtherUnit.finney, 1),
    );

    final credentials = WalletConnectEthereumCredentials(provider: provider);

    final txBytes = await ethereum.sendTransaction(credentials, transaction);

    print("txBytes" + txBytes);
    // Kill the session
    // connector.killSession();

    return txBytes;
  }

  @override
  Future<String> signTransactions(SessionStatus session) {
    // TODO: implement signTransactions
    print("2nd transaction");
    signTransaction(session);
    throw UnimplementedError();
  }
}

import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:voting_app/base_view_model.dart';
import 'package:voting_app/candidate_model.dart';
import 'package:voting_app/eth_transaction.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';

class HomeViewModel extends MyBaseViewModel {
  HomeViewModel(BuildContext context) {
    viewContext = context;
  }
  final String _rpcUrl =
      "https://rinkeby.infura.io/v3/${dotenv.get('INFURA_API_KEY', fallback: 'API_KEY not found')}";

  final String _wsUrl =
      "wss://rinkeby.infura.io/ws/v3/${dotenv.get('INFURA_API_KEY', fallback: 'API_KEY not found')}";
  // final String _privateKey =
  //     dotenv.get("GANACHE_PRIVATE_KEY", fallback: 'PRIVATE_KEY not found');
  SessionStatus? _sessionStatus;

  late ContractAbi _abiCode;
  late EthereumAddress _contractAddress;
  List<Candidate> get candidtes => _candidates;
  bool get walletConnected => _sessionStatus != null;
  bool get votedBefore => _votedBefore;
  String get address =>
      _sessionStatus != null ? _sessionStatus!.accounts[0] : "";
  bool get confirmTransaction => _confirmTransaction;
  double get percentage => _percentage;
  int get winnerId => _winnerId ?? 0;
  bool get waitingVoteConfiramtion => _waitingVoteConfirmation;
  bool _waitingVoteConfirmation = false;
  WalletConnect? connector;
  late Web3Client _web3client;
  bool _confirmTransaction = false;
  bool _votedBefore = false;
  double _percentage = 0.0;
  int? _winnerId;

  late DeployedContract _deployedContract;
  late ContractFunction _candidatesFunc;
  late ContractFunction _messageFunc;

  late ContractFunction _candidatesCountFunc;
  late ContractFunction _voteFunc;
  late ContractEvent _voteEvent;

  late ContractFunction _voters;
  late StreamSubscription _voteEventSubscription;
  List<Candidate> _candidates = [];
  late int _candidatesCount;

  setWaitingVoteConfiramtion(bool waiting) {
    _waitingVoteConfirmation = waiting;
    notifyListeners();
  }

  @override
  Future<void> initialise() async {
    super.initialise();
    final httpClient = Client();

    _web3client = Web3Client(
      _rpcUrl,
      httpClient,
    );
    await getAbi();
    await getDeployedContract();
    await fetchCandidates();
    _web3client
        .events(FilterOptions.events(
            contract: _deployedContract, event: _voteEvent))
        .take(1)
        .listen((event) async {
      await Future.delayed(const Duration(seconds: 1));
      await fetchCandidates();
      await checkVoter(_sessionStatus!.accounts[0]);
      print("event listend to");
      setWaitingVoteConfiramtion(false);

      notifyListeners();
    });
    // await _voteEventSubscription.asFuture();
  }

  Future<void> getAbi() async {
    // Reading the contract abi
    final abiStringFile =
        await rootBundle.loadString("build/contracts/Election.json");
    final jsonAbi = jsonDecode(abiStringFile);
    final jsonAbiJsonEncoded = jsonEncode(jsonAbi["abi"]);
    _abiCode = ContractAbi.fromJson(jsonAbiJsonEncoded, "Election");
    _contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["4"]["address"]);
  }

  Future<void> getDeployedContract() async {
    _deployedContract = DeployedContract((_abiCode), _contractAddress);
    _candidatesFunc = _deployedContract.function("candidates");
    _messageFunc = _deployedContract.function("message");

    _candidatesCountFunc = _deployedContract.function("candidatesCount");
    _voteFunc = _deployedContract.function("vote");
    _voters = _deployedContract.function("voters");
    _voteEvent = _deployedContract.event('votedEvent');
    // _voteEventSubscription =
    _web3client
        .events(FilterOptions.events(
            contract: _deployedContract, event: _voteEvent))
        .take(1)
        .listen((event) async {
      await fetchCandidates();
      await checkVoter(_sessionStatus!.accounts[0]);
    });
  }

  setConfirmTransaction() {
    _confirmTransaction = true;
    notifyListeners();
  }

  unsetConfirmTransaction() {
    _confirmTransaction = false;
    notifyListeners();
  }

  setVotedBefore() {
    _votedBefore = true;
    notifyListeners();
  }

  Future<void> checkVoter(String address) async {
    List voters = await _web3client.call(
        contract: _deployedContract,
        function: _voters,
        params: [EthereumAddress.fromHex(address)]);
    print(voters[0]);
    if (voters[0] == true) {
      setVotedBefore();
    }
  }

  countPercentage() {
    final int totalVotes = _candidates[0].candidateVotes!.toInt() +
        _candidates[1].candidateVotes!.toInt();
    final biggerVotes = max(_candidates[0].candidateVotes!.toInt(),
        _candidates[1].candidateVotes!.toInt());
    if (_candidates[0].candidateVotes!.toInt() == biggerVotes) {
      _winnerId = 1;
    } else {
      _winnerId = 2;
    }
    _percentage = biggerVotes / totalVotes;
    notifyListeners();
  }

  confirmWalletPopUp() {
    showModalBottomSheet(
        context: viewContext!,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            child: Column(
              children: [
                Text(
                  "Confirm the transaction from your wallet . . .",
                  style: Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  height: 17,
                ),
                Lottie.asset("assets/4470-payment-wallet.json",
                    width: 100, height: 100),
                Text(
                  "- Navigate to your wallet\n- Confirm the transaction.\n- Get back to see the voting results",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          );
        });
  }

  Future<void> fetchCandidates() async {
    _candidates = [];
    List count = await _web3client.call(
        contract: _deployedContract,
        function: _candidatesCountFunc,
        params: []);
    List message = await _web3client
        .call(contract: _deployedContract, function: _messageFunc, params: []);
    print(message[0]);
    _candidatesCount = count[0].toInt();
    for (int i = 1; i <= _candidatesCount; i++) {
      List candidates = await _web3client.call(
          contract: _deployedContract,
          function: _candidatesFunc,
          params: [BigInt.from(i)]);
      final Candidate candidate = Candidate(
          candidateName: candidates[0],
          candidateVotes: (candidates[1]).toInt(),
          candidateId: (candidates[2]).toInt());
      _candidates.add(candidate);
      print(candidates[0]);
      notifyListeners();
    }
    print("votes" +
        _candidates[0].candidateVotes!.toString() +
        _candidates[1].candidateVotes!.toString());
    countPercentage();
  }

  Future<void> voteToCandidate(int candidateId) async {
    showLoadingWidget();

    if (_sessionStatus != null) {
      await checkVoter(_sessionStatus!.accounts[0]);
      if (_votedBefore == false) {
        confirmWalletPopUp();
        final provider = EthereumWalletConnectProvider(connector!, chainId: 4);
        final cred = WalletConnectEthereumCredentials(
          provider: provider,
        );
        try {
          final chosenCandidate = _candidates
              .where(
                (element) => element.candidateId == candidateId,
              )
              .first;
          setConfirmTransaction();
          final hash = await _web3client.sendTransaction(
              cred,
              Transaction.callContract(
                contract: _deployedContract,
                function: _voteFunc,
                parameters: [BigInt.from(candidateId)],
                from: EthereumAddress.fromHex(
                    cred.provider.connector.session.accounts[0]),
              ),
              chainId: 4);
          setWaitingVoteConfiramtion(true);

          // notifyListeners();
          Navigator.of(viewContext!).pop();
          await Future.delayed(const Duration(milliseconds: 2));
          Navigator.of(viewContext!).pop();
          await Future.delayed(const Duration(milliseconds: 2));
          CoolAlert.show(
              context: viewContext!,
              type: CoolAlertType.success,
              text: "You have voted for ${chosenCandidate.candidateName}");
        } catch (e) {
          // if (_confirmTransaction == true) {
          //   Navigator.of(viewContext!).pop();
          // }
          CoolAlert.show(
              context: viewContext!,
              type: CoolAlertType.error,
              text: "You have voted before with this address");
        }

        await fetchCandidates();
      } else if (_votedBefore == true) {
        Navigator.of(viewContext!).pop();
        await Future.delayed(const Duration(milliseconds: 2));

        CoolAlert.show(
            context: viewContext!,
            type: CoolAlertType.error,
            text: "You have voted before with this address");
      }
    } else {
      loginUsingMetamask();
    }
  }

  loginUsingMetamask() async {
    connector = WalletConnect(
        bridge: 'https://bridge.walletconnect.org',
        clientMeta: const PeerMeta(
            name: 'My App',
            description: 'An app for converting pictures to NFT',
            url: 'https://walletconnect.org',
            icons: [
              'https://files.gitbook.com/v0/b/gitbook-legacy-files/o/spaces%2F-LJJeCjcLrr53DcT1Ml7%2Favatar.png?alt=media'
            ]));
    notifyListeners();
    if (!connector!.connected) {
      try {
        var session = await connector!.createSession(onDisplayUri: (uri) async {
          await launchUrl(Uri.parse(uri), mode: LaunchMode.externalApplication);
        });
        _sessionStatus = session;
        await checkVoter(_sessionStatus!.accounts[0]);
        notifyListeners();
        print(session.accounts[0]);
        print(session.chainId);
      } catch (exp) {
        print(exp);
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showLoadingWidget() {
    showDialog(
        context: viewContext!,
        builder: (context) => SizedBox(
              height: 45,
              width: 45,
              child: Transform.scale(
                scale: 0.05,
                child: const LinearProgressIndicator(
                    // backgroundColor: kLightGrey,
                    // valueColor: AlwaysStoppedAnimation(kPurple)
                    ),
              ),
            ));
  }
}

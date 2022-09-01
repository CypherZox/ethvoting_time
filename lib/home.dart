import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stacked/stacked.dart';
import 'package:voting_app/home.vm.dart';

enum TransactionState {
  disconnected,
  connecting,
  connected,
  connectionFailed,
  transferring,
  success,
  failed,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBFAFB),
      body: ViewModelBuilder<HomeViewModel>.reactive(
          viewModelBuilder: () => HomeViewModel(context),
          onModelReady: (model) async {
            await model.initialise();
          },
          builder: (context, elecetionVM, child) {
            return RefreshIndicator(
              onRefresh: () async {
                await elecetionVM.fetchCandidates();
              },
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 100, left: 14, right: 14),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            BouncingWidget(
                              duration: const Duration(milliseconds: 100),
                              scaleFactor: 1.5,
                              onPressed: () {
                                if (elecetionVM.walletConnected == true) {
                                  elecetionVM.voteToCandidate(
                                      elecetionVM.candidtes[0].candidateId!);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              const Color(0xffF4B227)
                                                  .withOpacity(0.9),
                                          content: Text(
                                              "Connect Your Wallet First!",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith())));
                                }
                              },
                              child: Container(
                                width: 150,
                                height: 180,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(11)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 25,
                                          spreadRadius: 0,
                                          color: Color(0xffEEF2F3),
                                          offset: Offset(12, 9))
                                    ]),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Transform.scale(
                                        scale: 2.0,
                                        child: SvgPicture.asset(
                                          "assets/icons8-jake-150.svg",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 53,
                                    ),
                                    elecetionVM.candidtes.isNotEmpty
                                        ? Text(
                                            elecetionVM
                                                .candidtes[0].candidateName!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          )
                                        : const Padding(
                                            padding: EdgeInsets.only(top: 12.0),
                                            child: LinearProgressIndicator(
                                                backgroundColor:
                                                    Color(0xffF4B227),
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.black))),
                                  ],
                                ),
                              ),
                            ),
                            BouncingWidget(
                              duration: const Duration(milliseconds: 100),
                              scaleFactor: 1.5,
                              onPressed: () {
                                if (elecetionVM.walletConnected == true) {
                                  elecetionVM.voteToCandidate(
                                      elecetionVM.candidtes[1].candidateId!);
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              const Color(0xff0399D7)
                                                  .withOpacity(0.9),
                                          content: Text(
                                              "Connect Your Wallet First!",
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith())));
                                }
                              },
                              child: Container(
                                width: 150,
                                height: 180,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(11)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: 25,
                                          color: Color(0xffEEF2F3))
                                    ]),
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Transform.scale(
                                        scale: 2.0,
                                        child: SvgPicture.asset(
                                          "assets/icons8-finn-150.svg",
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 53,
                                    ),
                                    elecetionVM.candidtes.length >= 2
                                        ? Text(
                                            elecetionVM
                                                .candidtes[1].candidateName!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          )
                                        : const Padding(
                                            padding: EdgeInsets.only(top: 12.0),
                                            child: LinearProgressIndicator(
                                                backgroundColor:
                                                    Color(0xff0399D7),
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(Colors.black)),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Visibility(
                        visible: elecetionVM.votedBefore,
                        child: elecetionVM.candidtes.length >= 2
                            ? Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    child: Text(
                                      elecetionVM.candidtes[0].candidateVotes
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: Colors.white),
                                    ),
                                    backgroundColor: Color(0xffF4B227),
                                  ),
                                  CircleAvatar(
                                    child: Text(
                                      elecetionVM.candidtes[1].candidateVotes
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: Colors.white),
                                    ),
                                    backgroundColor: Color(0xff0399D7),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Visibility(
                        visible: !elecetionVM.walletConnected,
                        child: Column(children: [
                          Text(
                            "Connect your Wallet first . . .",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                          GestureDetector(
                            onTap: () {
                              elecetionVM.loginUsingMetamask();
                            },
                            child: Lottie.asset(
                                "assets/4470-payment-wallet.json",
                                width: 100,
                                height: 100),
                          ),
                        ]),
                        replacement: Visibility(
                          visible: !elecetionVM.votedBefore,
                          replacement: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Results",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(fontSize: 26),
                              ),
                              CircularPercentIndicator(
                                radius: 120.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: elecetionVM.percentage,
                                center: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    elecetionVM.winnerId == 1 &&
                                            elecetionVM.percentage != 0.5
                                        ? Lottie.asset(
                                            "assets/icons8-jake.json",
                                            height: 80,
                                            width: 80,
                                          )
                                        : elecetionVM.winnerId == 2 &&
                                                elecetionVM.percentage != 0.5
                                            ? Lottie.asset(
                                                "assets/icons8-finn.json",
                                                height: 80,
                                                width: 80)
                                            : const SizedBox(),
                                    Text(
                                      double.parse(
                                                  (elecetionVM.percentage * 100)
                                                      .toStringAsFixed(1))
                                              .toString() +
                                          "%",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    )
                                  ],
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: elecetionVM.winnerId == 1
                                    ? const Color(0xffF4B227)
                                    : const Color(0xff0399D7),
                                backgroundColor: elecetionVM.winnerId == 1
                                    ? const Color(0xff0399D7)
                                    : const Color(0xffF4B227),
                              )
                            ],
                          ),
                          child: Visibility(
                            visible: !elecetionVM.waitingVoteConfiramtion,
                            replacement: Column(
                              children: [
                                Text(
                                  "Waiting for voting confirmation",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Lottie.asset(
                                    "assets/57498-waiting-pendulum.json",
                                    width: 100,
                                    height: 100)
                              ],
                            ),
                            child: Column(children: [
                              const SizedBox(
                                height: 40,
                              ),
                              Text(
                                "You can now vote with",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                elecetionVM.address,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontWeight: FontWeight.w700),
                              ),
                            ]),
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            );
          }),
    );
  }
}

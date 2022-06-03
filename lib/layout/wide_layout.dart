import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/layout/ui_constants.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';
import 'package:speedcodingcompetition/provider/loginprovider.dart';
import 'package:speedcodingcompetition/widget/catchertext.dart';
import 'package:speedcodingcompetition/widget/invitelist.dart';
import 'package:speedcodingcompetition/widget/mainlogo.dart';
import 'package:speedcodingcompetition/widget/rulelist.dart';
import 'package:speedcodingcompetition/widget/timewidget.dart';

class WideLayout extends StatelessWidget {
  const WideLayout({Key? key}) : super(key: key);

  SizedBox buildSizedBox() => const SizedBox(height: 50);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speedcoding Competition'),
        leadingWidth: 200,
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
                onPressed: () => UIConst.showAllRulesDialog(context),
                child: const Text("Rules")),
            TextButton(
                onPressed: () => UIConst.showCompetitionsDialog(context),
                child: const Text("Competitions")),
          ],
        ),
        actions: [
          if (context.select((LoginProvider l) => !l.isLoggedIn)) ...[
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => print("here"), //TODO
            ),
            IconButton(
              icon: const Icon(Icons.login),
              onPressed: () => print("here"),
            ),
          ],
          if (context.select((LoginProvider l) => l.isLoggedIn))
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => print("here"),
            ),
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () => print("here"),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(minWidth: 0, maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const MainLogo(),
                      buildSizedBox(),
                      const Text(
                        "Step 1: Choose Rules",
                        style: TextStyle(fontSize: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            const Expanded(flex: 1, child: RuleList()),
                            Expanded(
                                flex: 1,
                                child: Center(
                                    child: Column(
                                  children: [
                                    RichText(
                                        softWrap: true,
                                        text: TextSpan(
                                            text:
                                                "Choose 5 or more rules out of ${context.watch<DataProvider>().rules.length}.",
                                            style: UIConst.defaultTextStyle)),
                                    const SizedBox(height: 15),
                                    ElevatedButton(
                                        onPressed: () =>
                                            UIConst.showAllRulesDialog(context),
                                        child: const SizedBox(
                                            width: 150,
                                            child: Center(
                                                child: Text("See all rules")))),
                                    const SizedBox(height: 15),
                                    ElevatedButton(
                                        onPressed: () =>
                                            UIConst.showNewRuleDialog(context),
                                        child: const SizedBox(
                                            width: 150,
                                            child: Center(
                                                child: Text(
                                                    "Suggest a new rule")))),
                                  ],
                                )))
                          ],
                        ),
                      ),
                      buildSizedBox(),
                      const Text(
                        "Step 2: Choose Times",
                        style: TextStyle(fontSize: 40),
                      ),
                      buildSizedBox(),
                      Row(
                        children: const <Widget>[
                          Expanded(
                              flex: 1,
                              child: CatcherText(
                                  defaultTextStyle: UIConst.defaultTextStyle,
                                  text:
                                      "How far will you go?\nOnly one day? or maybe a month?\n")),
                          Expanded(
                            flex: 1,
                            child: TimeWidget(),
                          )
                        ],
                      ),
                      buildSizedBox(),
                      const Text(
                        "Step 3: Invite Friends",
                        style: TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        children: <Widget>[
                          const Expanded(flex: 1, child: InviteList()),
                          Expanded(
                              flex: 1,
                              child: Center(
                                  child: Column(
                                children: [
                                  RichText(
                                      softWrap: true,
                                      text: const TextSpan(
                                          text:
                                              "Who will be with you?\nInvite all your friends!",
                                          style: UIConst.defaultTextStyle)),
                                ],
                              )))
                        ],
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: () =>
                              UIConst.showStartCompetitionDialog(context),
                          child: const SizedBox(
                              width: 600,
                              child: Center(
                                  child: Text(
                                "Start your competition",
                                style: TextStyle(fontSize: 35),
                              )))),
                      buildSizedBox(),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                color: Colors.black,
                child: Center(
                  child: Text(
                    "Footer",
                    style:
                        UIConst.defaultTextStyle.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

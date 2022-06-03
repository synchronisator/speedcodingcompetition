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

class MediumLayout extends StatelessWidget {
  const MediumLayout({Key? key}) : super(key: key);

  SizedBox buildSizedBox() => const SizedBox(height: 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speedcoding Competition'),
        actions: [
          if (context.select((LoginProvider l) => !l.isLoggedIn)) ...[
            const IconButton(
              icon: Icon(Icons.person),
              onPressed: null,
            ),
            const IconButton(
              icon: Icon(Icons.login),
              onPressed: null,
            ),
          ],
          if (context.select((LoginProvider l) => l.isLoggedIn))
            const IconButton(
              icon: Icon(Icons.logout),
              onPressed: null,
            ),
          const IconButton(
            icon: Icon(Icons.star),
            onPressed: null,
          ),
        ],
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(
                  onPressed: () => UIConst.showAllRulesDialog(context),
                  child: const Text("Rules")),
              TextButton(
                  onPressed: () => UIConst.showCompetitionsDialog(context),
                  child: const Text("Competitions")),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints(minWidth: 0, maxWidth: 600),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FittedBox(fit: BoxFit.fill, child: MainLogo()),
                      //TODO bug
                      buildSizedBox(),
                      const Text(
                        "Step 1: Choose Rules",
                        style: TextStyle(fontSize: 40),
                      ),
                      buildSizedBox(),
                      Center(
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
                                  child: Center(child: Text("See all rules")))),
                          const SizedBox(height: 15),
                          ElevatedButton(
                              onPressed: () =>
                                  UIConst.showNewRuleDialog(context),
                              child: const SizedBox(
                                  width: 150,
                                  child: Center(
                                      child: Text("Suggest a new rule")))),
                        ],
                      )),
                      buildSizedBox(),
                      RuleList(),
                      buildSizedBox(),
                      const Text(
                        "Step 2: Choose Times",
                        style: TextStyle(fontSize: 40),
                      ),
                      buildSizedBox(),
                      const CatcherText(
                          defaultTextStyle: UIConst.defaultTextStyle,
                          text:
                              "How far will you go?\nOnly one day? or maybe a month?\n"),
                      TimeWidget(
                          defaultTextStyle: UIConst.defaultTextStyle,
                          formatDate: UIConst.formatDate),
                      buildSizedBox(),
                      const Text(
                        "Step 3: Invite Friends",
                        style: TextStyle(fontSize: 40),
                      ),
                      buildSizedBox(),
                      const CatcherText(
                          defaultTextStyle: UIConst.defaultTextStyle,
                          text:
                              "Who will be with you?\nInvite all your friends!"),
                      buildSizedBox(),
                      const InviteList(),
                      buildSizedBox(),
                      ElevatedButton(
                          onPressed: () => UIConst.showNewRuleDialog(context),
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

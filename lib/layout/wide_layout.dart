import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';
import 'package:speedcodingcompetition/provider/loginprovider.dart';
import 'package:speedcodingcompetition/widget/rulelist.dart';

class WideLayout extends StatelessWidget {
  static final formatDate = DateFormat('dd.MM.yyyy HH:mm');
  static const defaultTextStyle = TextStyle(color: Colors.black, fontSize: 25);

  const WideLayout({Key? key}) : super(key: key);

  showCompetitionsDialog(BuildContext context) {}

  showAllRulesDialog(BuildContext context) {}

  showNewRuleDialog(BuildContext context) {}

  showInviteDialog(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Speedcoding Competition'),
        leadingWidth: 200, //TODO
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(onPressed: () => showAllRulesDialog(context), child: const Text("Rules")),
            TextButton(onPressed: () => showCompetitionsDialog(context), child: const Text("Competitions")),
          ],
        ),
        actions: [
          if (context.select((LoginProvider l) => !l.isLoggedIn)) ...[
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () => print("here"),
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
          const IconButton(
            icon: Icon(Icons.star),
            onPressed: null,
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
                      Stack(
                        children: const [
                          Image(image: AssetImage('assets/img/dummy.png')),
                          Positioned(
                              left: 30,
                              top: 50,
                              child: Text(
                                "Tired of slowly coding useless projects?",
                                style: TextStyle(fontSize: 50),
                              )),
                          Positioned(
                              left: 30,
                              top: 150,
                              child: Text(
                                "Try Speedcode!",
                                style: TextStyle(fontSize: 40),
                              )),
                          Positioned(
                              left: 30,
                              top: 250,
                              child: Text(
                                "Create useless projects FASTER!",
                                style: TextStyle(fontSize: 40),
                              )),
                        ],
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Step 1: Choose Rules",
                        style: TextStyle(fontSize: 40),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(flex: 1, child: RuleList()),
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
                                            style: defaultTextStyle)),
                                    const SizedBox(height: 15),
                                    ElevatedButton(
                                        onPressed: () =>
                                            showAllRulesDialog(context),
                                        child: const SizedBox(
                                            width: 150,
                                            child: Center(
                                                child: Text("See all rules")))),
                                    const SizedBox(height: 15),
                                    ElevatedButton(
                                        onPressed: () => showNewRuleDialog(context),
                                        child: const SizedBox(
                                            width: 150,
                                            child: Center(
                                                child:
                                                    Text("Suggest a new rule")))),
                                  ],
                                )))
                          ],
                        ),
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Step 2: Choose Times",
                        style: TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        children: <Widget>[
                          Expanded(
                              flex: 1,
                              child: Center(
                                  child: Column(
                                children: [
                                  RichText(
                                      softWrap: true,
                                      text: const TextSpan(
                                          text:
                                              "How far will you go?\nOnly one day? or maybe a month?\n",
                                          style: defaultTextStyle)),
                                ],
                              ))),
                          Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Startzeit", style: defaultTextStyle),
                                  TextButton(
                                      onPressed: () => showDatePicker(
                                            context: context,
                                            initialDate: context
                                                .read<DataProvider>()
                                                .vonDate,
                                            firstDate: DateTime.now(),
                                            lastDate: context
                                                .read<DataProvider>()
                                                .bisDate,
                                          ).then((value) => showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((val) => context
                                                  .read<DataProvider>()
                                                  .setVonDate(value?.add(Duration(
                                                      hours: val?.hour ?? 0,
                                                      minutes:
                                                          val?.minute ?? 0))))),
                                      child: Text(formatDate
                                          .format(context.watch<DataProvider>().vonDate), style: defaultTextStyle)),
                                  const Text("Deadline", style: defaultTextStyle,),
                                  TextButton(
                                      onPressed: () => showDatePicker(
                                            context: context,
                                            initialDate: context
                                                .read<DataProvider>()
                                                .bisDate,
                                            firstDate: context
                                                .read<DataProvider>()
                                                .vonDate,
                                            lastDate: DateTime.now()
                                                .add(const Duration(days: 365)),
                                          ).then((value) => showTimePicker(
                                                  context: context,
                                                  initialTime: TimeOfDay.now())
                                              .then((val) => context
                                                  .read<DataProvider>()
                                                  .setBisDate(value?.add(Duration(
                                                      hours: val?.hour ?? 0,
                                                      minutes:
                                                          val?.minute ?? 0))))),
                                      child: Text(formatDate
                                          .format(context.watch<DataProvider>().bisDate), style: defaultTextStyle)),
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(height: 50),
                      const Text(
                        "Step 3: Invite Friends",
                        style: TextStyle(fontSize: 40),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        children: <Widget>[
                          Expanded(flex: 1, child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: 5,
                                  itemBuilder: (context, index) => Card(child: ListTile(title: Text("dummy$index@dummy.de"),)),),
                              FloatingActionButton(child: const Icon(Icons.add), onPressed: () => showInviteDialog(context),)
                            ],
                          )),
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
                                          style: defaultTextStyle)),
                                ],
                              )))
                        ],
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton(
                          onPressed: () => showNewRuleDialog(context),
                          child: const SizedBox(
                              width: 600,
                              child: Center(
                                  child: Text(
                                "Start your competition",
                                style: TextStyle(fontSize: 35),
                              )))),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                color: Colors.black,
                child: Center(child: Text("Footer", style: defaultTextStyle.copyWith(color: Colors.white),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';
import 'package:speedcodingcompetition/provider/loginprovider.dart';
import 'package:speedcodingcompetition/widget/rulelist.dart';

class WideLayout extends StatelessWidget {
  static final formatDate = DateFormat('dd.MM.yyyy HH:mm');

  const WideLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speedcoding Competition'),
        leadingWidth: 50, //TODO
        leading: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("ad"),
            Text("ad"),
            Text("ad"),
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
              onPressed: null,
            ),
          ],
          if (context.select((LoginProvider l) => l.isLoggedIn))
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: null,
            ),
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: null,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            constraints: BoxConstraints(minWidth: 0, maxWidth: 1200),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      const Image(
                          image: AssetImage('assets/img/dummy.png')),
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
                            "Make useless projects FASTER!",
                            style: TextStyle(fontSize: 40),
                          )),
                    ],
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Step 1: Choose Rules",
                    style: TextStyle(fontSize: 40),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(flex: 1, child: RuleList()),
                        Expanded(flex: 1, child: Center(child: Text("asd")))
                      ],
                    ),
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Step 2: Choose Times",
                    style: TextStyle(fontSize: 40),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(flex: 1, child: Text("asd")),
                      Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Startzeit"),
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
                                  child: Text(formatDate.format(context
                                      .watch<DataProvider>()
                                      .vonDate))),
                              Text("Deadline"),
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
                                            .add(Duration(days: 365)),
                                      ).then((value) => showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                          .then((val) => context
                                              .read<DataProvider>()
                                              .setBisDate(value?.add(Duration(
                                                  hours: val?.hour ?? 0,
                                                  minutes:
                                                      val?.minute ?? 0))))),
                                  child: Text(formatDate.format(context
                                      .watch<DataProvider>()
                                      .bisDate))),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(height: 50),
                  Text(
                    "Step 3: Invite Friends",
                    style: TextStyle(fontSize: 40),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(flex: 1, child: Text("asd")),
                      Expanded(flex: 1, child: Text("asd"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

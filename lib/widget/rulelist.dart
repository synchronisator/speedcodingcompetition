import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/data/rule.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';

class RuleList extends StatelessWidget {
  const RuleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: context.read<DataProvider>().rules.length,
        itemBuilder: (context, index) {
          Rule r = context.read<DataProvider>().rules[index];
          return Card(
            color: Colors.blue,
            child: ListTile(
              title: Text(r.text),
              subtitle: Text(r.description),
            ),
          );
        },
    );
  }
}

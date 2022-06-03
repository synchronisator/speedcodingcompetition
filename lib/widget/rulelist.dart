import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/data/rule.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';

class RuleList extends StatelessWidget {
  const RuleList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: context.watch<DataProvider>().rulesForCompetition.length + 1,
      itemBuilder: (context, index) {
        if (index == context.read<DataProvider>().rulesForCompetition.length) {
          return context.read<DataProvider>().rulesForCompetition.length ==
                  context.read<DataProvider>().rules.length
              ? const SizedBox.shrink()
              : Center(
                  child: IconButton(
                      icon: const Icon(Icons.add),
                      onPressed:
                          context.read<DataProvider>().addRuleToCompetition));
        }
        Rule r = context.read<DataProvider>().rulesForCompetition[index];
        return Card(
          child: ListTile(
            title: Text(r.text),
            subtitle: Text(r.description),
            trailing: IconButton(
              onPressed: () => context.read<DataProvider>().changeRule(index),
              icon: const Icon(Icons.refresh),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/data/rule.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';
import 'package:speedcodingcompetition/widget/rulelist.dart';

class AllRulesDialog extends StatefulWidget {
  const AllRulesDialog({Key? key}) : super(key: key);

  @override
  _AllRulesDialogState createState() => _AllRulesDialogState();
}

class _AllRulesDialogState extends State<AllRulesDialog> {


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "All Rules",
        style: TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width > 400 ? 350 : double.maxFinite,
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: context.watch<DataProvider>().rules.length,
              separatorBuilder:  (context, index) => const Divider(),
              itemBuilder: (context, index) {
                Rule r = context.read<DataProvider>().rules[index];
                return ListTile(
                  title: Text(r.text),
                  subtitle: Text(r.description),
                );
              },
            )
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}

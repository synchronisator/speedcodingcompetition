import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/data/competition.dart';
import 'package:speedcodingcompetition/layout/ui_constants.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';

class AllCompetitionsDialog extends StatefulWidget {
  const AllCompetitionsDialog({Key? key}) : super(key: key);

  @override
  _AllCompetitionsDialogState createState() => _AllCompetitionsDialogState();
}

class _AllCompetitionsDialogState extends State<AllCompetitionsDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "All Competitions",
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
                itemCount: context.watch<DataProvider>().competition.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  Competition c =
                      context.read<DataProvider>().competition[index];
                  return ListTile(
                    title: Text(c.text),
                    subtitle: Text(
                        "${UIConst.formatDate.format(c.startTime)} -> ${UIConst.formatDate.format(c.deadline)}"),
                  );
                },
              )),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';

class StartCompetitionDialog extends StatefulWidget {
  const StartCompetitionDialog({Key? key}) : super(key: key);

  @override
  _StartCompetitionDialogState createState() => _StartCompetitionDialogState();
}

class _StartCompetitionDialogState extends State<StartCompetitionDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Start Competition",
        style: TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width > 400 ? 350 : double.maxFinite,
        child: const Card(
          elevation: 3,
          child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Start!") //TODO Display settings,  texteingabe
              ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            child: const Text("Start"),
            onPressed: () {
              context
                  .read<DataProvider>()
                  .startCompetition("Beispieltext"); //TODO
              Navigator.pop(context);
            }),
        ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}

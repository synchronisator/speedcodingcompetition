import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';

class NewRuleDialog extends StatefulWidget {
  const NewRuleDialog({Key? key}) : super(key: key);

  @override
  _NewRuleDialogState createState() => _NewRuleDialogState();
}

class _NewRuleDialogState extends State<NewRuleDialog> {
  var textEditingControllerTitle = TextEditingController();
  var textEditingControllerText = TextEditingController();

  @override
  void initState() {
    super.initState();
    textEditingControllerTitle.text = "";
    textEditingControllerTitle.addListener(() {
      setState(() {});
    });
    textEditingControllerText.text = "";
    textEditingControllerText.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    textEditingControllerTitle.dispose();
    textEditingControllerText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Suggest a new Rule",
        style: TextStyle(color: Colors.white),
      ),
      content: SizedBox(
        width: MediaQuery.of(context).size.width > 400 ? 350 : double.maxFinite,
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: textEditingControllerTitle,
                  decoration: const InputDecoration(hintText: "Text"),
                ),
                TextField(
                  maxLines: 10,
                  decoration: const InputDecoration(hintText: "Description"),
                  controller: textEditingControllerText,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
            child: const Text("Send"),
            onPressed: () {
              context.read<DataProvider>().addRule(
                  textEditingControllerTitle.text,
                  textEditingControllerText.text);
              Navigator.pop(context);
            }),
        const VerticalDivider(),
        ElevatedButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.pop(context);
            }),
      ],
    );
  }
}

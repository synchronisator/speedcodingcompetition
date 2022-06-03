import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/layout/ui_constants.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Start", style: UIConst.defaultTextStyle),
        TextButton(
            onPressed: () => showDatePicker(
                  context: context,
                  initialDate: context.read<DataProvider>().vonDate,
                  firstDate: DateTime.now(),
                  lastDate: context.read<DataProvider>().bisDate,
                ).then((value) => showTimePicker(
                        context: context, initialTime: TimeOfDay.now())
                    .then((val) => context.read<DataProvider>().setVonDate(
                        value?.add(Duration(
                            hours: val?.hour ?? 0,
                            minutes: val?.minute ?? 0))))),
            child: Text(
                UIConst.formatDate
                    .format(context.watch<DataProvider>().vonDate),
                style: UIConst.defaultTextStyle)),
        const Text(
          "Deadline",
          style: UIConst.defaultTextStyle,
        ),
        TextButton(
            onPressed: () => showDatePicker(
                  context: context,
                  initialDate: context.read<DataProvider>().bisDate,
                  firstDate: context.read<DataProvider>().vonDate,
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                ).then((value) => showTimePicker(
                        context: context, initialTime: TimeOfDay.now())
                    .then((val) => context.read<DataProvider>().setBisDate(
                        value?.add(Duration(
                            hours: val?.hour ?? 0,
                            minutes: val?.minute ?? 0))))),
            child: Text(
                UIConst.formatDate
                    .format(context.watch<DataProvider>().bisDate),
                style: UIConst.defaultTextStyle)),
      ],
    );
  }
}

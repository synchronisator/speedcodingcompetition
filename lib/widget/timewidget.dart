import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({
    Key? key,
    required this.defaultTextStyle,
    required this.formatDate,
  }) : super(key: key);

  final TextStyle defaultTextStyle;
  final DateFormat formatDate;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text("Start", style: defaultTextStyle),
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
                formatDate.format(context.watch<DataProvider>().vonDate),
                style: defaultTextStyle)),
        Text(
          "Deadline",
          style: defaultTextStyle,
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
                formatDate.format(context.watch<DataProvider>().bisDate),
                style: defaultTextStyle)),
      ],
    );
  }
}

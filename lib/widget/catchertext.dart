import 'package:flutter/material.dart';

class CatcherText extends StatelessWidget {
  const CatcherText({
    Key? key,
    required this.defaultTextStyle,
    required this.text,
  }) : super(key: key);

  final TextStyle defaultTextStyle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        RichText(
            softWrap: true,
            text: TextSpan(text: text, style: defaultTextStyle)),
      ],
    ));
  }
}

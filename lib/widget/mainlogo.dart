
import 'package:flutter/material.dart';

class MainLogo extends StatelessWidget {
  const MainLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Image(image: AssetImage('assets/img/dummy.png')),
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
              "Create useless projects FASTER!",
              style: TextStyle(fontSize: 40),
            )),
      ],
    );
  }
}
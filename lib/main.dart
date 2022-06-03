import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:speedcodingcompetition/layout/medium_layout.dart';
import 'package:speedcodingcompetition/layout/narrow_layout.dart';
import 'package:speedcodingcompetition/layout/wide_layout.dart';
import 'package:speedcodingcompetition/provider/dataprovider.dart';
import 'package:speedcodingcompetition/provider/loginprovider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (BuildContext context) => LoginProvider()),
    ChangeNotifierProvider(create: (BuildContext context) => DataProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static Map<int, Color> color = {
    50: const Color.fromRGBO(7, 15, 36, .1),
    100: const Color.fromRGBO(7, 15, 36, .2),
    200: const Color.fromRGBO(7, 15, 36, .3),
    300: const Color.fromRGBO(7, 15, 36, .4),
    400: const Color.fromRGBO(7, 15, 36, .5),
    500: const Color.fromRGBO(7, 15, 36, .6),
    600: const Color.fromRGBO(7, 15, 36, .7),
    700: const Color.fromRGBO(7, 15, 36, .8),
    800: const Color.fromRGBO(7, 15, 36, .9),
    900: const Color.fromRGBO(7, 15, 36, 1.0),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speedcoding Competition',
      theme: ThemeData(
          primarySwatch: MaterialColor(0xFF070F24, color),
          scaffoldBackgroundColor: Colors.black12,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 2,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: Colors.black,
                fontSize: 30,
                fontFamily: ""),
            toolbarTextStyle:
                TextStyle(overflow: TextOverflow.ellipsis, color: Colors.black),
            actionsIconTheme: IconThemeData(color: Colors.black, size: 35),
          ),
          dialogTheme: const DialogTheme(
            backgroundColor: Color(0xFF373737),
          ),
          cardTheme: const CardTheme(
              color: Colors.white,
              elevation: 6,
              surfaceTintColor: Colors.orange)),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (size.width <= 478) {
      return const NarrowLayout(); // < 478px Mobile
    } else if (size.width <= 991) {
      return const MediumLayout(); // < 991px Tablet portrait
    } else {
      // >= 992 Everything else
      return const WideLayout();
    }
  }
}

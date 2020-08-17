import 'package:covid19/Screen/sriLanka.dart';
import 'package:flutter/material.dart';
import 'Screen/homeScreen.dart';
import 'Screen/Search.dart';
import 'Screen/sriLanka.dart';

void main() {
  runApp(Covid());
}

class Covid extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/country': (context) => SriLanka(),
        '/search': (context) => SearchByCountry(),
      },
    );
  }
}

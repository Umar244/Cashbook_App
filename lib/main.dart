import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'Widgets/Entry.dart';
import 'AddEntry.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            //brightness: Brightness.dark,
            primaryColor: Colors.lightBlue[800],
            accentColor: Colors.cyan[600],

            // Define the default font family.
            fontFamily: 'Georgia',

            // Define the default TextTheme. Use this to specify the default
            // text styling for headlines, titles, bodies of text, and more.
            textTheme: const TextTheme(
              headline1: TextStyle(
                  fontSize: 72.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.normal),
              subtitle1: TextStyle(fontSize: 24.0, fontStyle: FontStyle.normal),
              bodyText2: TextStyle(fontSize: 18.0, fontFamily: 'Hind'),
            ),
            textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)))),
        title: 'cashbook App',
        home: HomePage());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:voting_app/home.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 43.0,
                fontWeight: FontWeight.bold,
                fontFamily: "LearnShareColaborate",
                color: Colors.black),
            headline6: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
                fontFamily: "LearnShareColaborate",
                color: Colors.black),
            bodyText1: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
                fontFamily: 'fontFamily: "LearnShareColaborate"'),
          ),
        ),
        home: const MyHomePage());
  }
}

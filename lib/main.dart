import 'package:election_exit_poll_07610409/pages/poll_page.dart';
import 'package:election_exit_poll_07610409/pages/result_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Poll(),
      routes: {
        Result.routeName: (context) => const Result(),

      },
     initialRoute: Poll.routeName,
    );
  }
}


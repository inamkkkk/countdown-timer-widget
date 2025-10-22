import 'package:flutter/material.dart';
import 'package:countdown_timer/screens/countdown_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountdownScreen(duration: Duration(minutes: 5)),
    );
  }
}

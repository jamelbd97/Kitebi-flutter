import 'package:flutter/material.dart';
import 'package:kitebi/Views/home.dart';
import 'package:kitebi/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Kitebi',
        theme: ThemeData(
          primaryColor: Constants.primaryColor
        ),
        home: const Home());
  }
}

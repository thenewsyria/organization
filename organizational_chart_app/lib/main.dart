import 'package:flutter/material.dart';
import 'package:organizational_chart_app/screens/chart_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Organizational',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChartScreen());
  }
}

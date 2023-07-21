import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/chart_provider.dart';
import '../models/person.dart';

class ChartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Organizational Chart App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Organizational Chart'),
        ),
        body: Center(
          child: Text('Organizational Chart will be displayed here.'),
        ),
      ),
    );
  }
}

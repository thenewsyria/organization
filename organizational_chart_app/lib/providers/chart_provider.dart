import 'package:flutter/material.dart';
import '../models/person.dart';
// This class will manage the data for your organizational chart

class ChartProvider with ChangeNotifier {
  List<Person> _people = [
    Person(name: 'John Doe', position: 'Manager', downlines: [
      Person(name: 'Alice', position: 'HR Person'),
      Person(name: 'Bob', position: 'HR Person'),
    ]),
    // Add more people here
  ];

  List<Person> get people => _people;

  void addPerson(Person person, Person upline) {
    // Add the person to the upline's downlines
    upline.downlines.add(person);
    notifyListeners();
  }

  // Implement delete, update, and image upload functions here if needed
}

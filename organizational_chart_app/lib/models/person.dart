class Person {
  String name;
  String position;
  List<Person> downlines;

  Person(
      {required this.name, required this.position, this.downlines = const []});
}

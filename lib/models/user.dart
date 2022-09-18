class User {
  String name;
  int age;
  List<String> profs;

  User({
    required this.name,
    this.age = 0,
    this.profs = const [],
  });
}

class User {
  final String name;
  final int age;
  final List<String> profs;

  User({
    this.name = 'Sin Nombre',
    this.age = 0,
    this.profs = const [],
  });

  User copyWith({
    String? name,
    int? age,
    List<String>? profs,
  }) =>
      User(
        name: name ?? this.name,
        age: age ?? this.age,
        profs: profs ?? this.profs,
      );
}

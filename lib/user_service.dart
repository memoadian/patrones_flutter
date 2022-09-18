import 'dart:async';

import 'package:singleton/models/user.dart';

class _UserService {
  User? _user;

  final StreamController<User> _userStreamController =
      StreamController<User>.broadcast();
  User get user => _user!;
  bool get userExists => _user != null ? true : false;

  Stream<User> get userStream => _userStreamController.stream;

  void loadUsuario(User user) {
    _user = user;
    _userStreamController.add(user);
  }

  void changeAge(int age) {
    _user!.age = age;
    _userStreamController.add(_user!);
  }

  void addProfession(String profession) {
    _user!.profs.add(profession);
    _userStreamController.add(_user!);
  }

  dispose() {
    _userStreamController.close();
  }
}

final userService = _UserService();

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:singleton/models/user.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void addUser(User user) {
    emit(UserActive(user));
  }

  //void userExists() => emit(UserInitial());

  /*void changeAge(int age) {
    final user = (state as UserActive).user;
    user.age = age;
    emit(UserActive(user));
  }*/

  void changeAge(int age) {
    final currentState = state as UserActive;
    final newUser = currentState.user.copyWith(age: age);
    emit(UserActive(newUser));
  }

  void addProfession(String profession) {
    final user = (state as UserActive).user;
    user.profs.add(profession);
    emit(UserActive(user));
  }

  void deleteUser() => emit(UserInitial());
}

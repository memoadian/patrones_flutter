import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user/user_cubit.dart';
import '../models/user.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = context.read<UserCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                final user = User(
                  name: 'Juan',
                  age: 30,
                  profs: ['Android Dev', 'Game Dev'],
                );
                userCubit.addUser(user);
              },
              child: const Text(
                'Establecer Usuario',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userCubit.changeAge(20);
              },
              child: const Text(
                'Cambiar Edad',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                userCubit.addProfession('Flutter Dev');
              },
              child: const Text(
                'Añadir Profesión',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

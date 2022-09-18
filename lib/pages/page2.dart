import 'package:flutter/material.dart';
import 'package:singleton/user_service.dart';

import '../models/user.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: userService.userStream,
          builder: (_, AsyncSnapshot<User> snapshot) {
            return snapshot.hasData
                ? Text('Nombre: ${snapshot.data!.name}')
                : const Text('Página 2');
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                User user = User(
                  name: 'Juan',
                  age: 30,
                );
                userService.loadUsuario(user);
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
                userService.changeAge(35);
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
                userService.addProfession('Developer');
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

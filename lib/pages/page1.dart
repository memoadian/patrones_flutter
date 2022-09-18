import 'package:flutter/material.dart';
import 'package:singleton/user_service.dart';

import '../models/user.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: StreamBuilder(
        stream: userService.userStream,
        builder: (_, AsyncSnapshot<User> snapshot) {
          return snapshot.hasData
              ? InformacionUsuario(userService.user)
              : const Center(
                  child: Text('No hay usuario'),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'page2');
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  const InformacionUsuario(this.user, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListTile(
            title: Text('Nombre: ${user.name}'),
          ),
          ListTile(
            title: Text('Edad: ${user.age}'),
          ),
          const Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(),
          ListView.builder(
            itemBuilder: _profesionTile,
            itemCount: user.profs.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _profesionTile(BuildContext context, int index) {
    return ListTile(
      title: Text(user.profs[index]),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/usuario.dart';
import '../services/user_service.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final userService = Provider.of<UserService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        actions: [
          IconButton(
            onPressed: () {
              userService.removeUser();
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: userService.userExists
          ? InformacionUsuario(userService.user)
          : const Center(
              child: Text('No hay usuario seleccionado'),
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
  final User? user;

  const InformacionUsuario(this.user);

  @override
  Widget build(BuildContext context) {
    print('Nombre: ${user!.profs}');
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
            title: Text('Nombre: ${user!.name}'),
          ),
          ListTile(
            title: Text('Edad: ${user!.age}'),
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
            itemBuilder: _profsList,
            itemCount: user!.profs.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _profsList(BuildContext context, int index) {
    return ListTile(
      title: Text(user!.profs[index]),
    );
  }
}

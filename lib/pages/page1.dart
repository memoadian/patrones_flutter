import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/bloc/user/user_cubit.dart';

import '../models/user.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => context.read<UserCubit>().deleteUser(),
          ),
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'page2');
        },
        child: const Icon(Icons.navigate_next),
      ),
    );
  }
}

class BodyScaffold extends StatelessWidget {
  const BodyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(builder: (_, state) {
      switch (state.runtimeType) {
        case UserInitial:
          return const Center(
            child: Text('No hay usuario'),
          );
        case UserActive:
          final user = (state as UserActive).user;
          return InformacionUsuario(user);
        default:
          return const Center(
            child: Text('No hay usuario'),
          );
      }
    });
  }
}

class InformacionUsuario extends StatelessWidget {
  final User user;

  const InformacionUsuario(this.user);

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
            itemBuilder: _profsList,
            itemCount: user.profs.length,
            shrinkWrap: true,
          ),
        ],
      ),
    );
  }

  Widget _profsList(BuildContext context, int index) {
    return ListTile(
      title: Text(user.profs[index]),
    );
  }
}

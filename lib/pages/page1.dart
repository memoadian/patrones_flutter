import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: InformacionUsuario(),
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
  /*const InformacionUsuario({
    Key? key,
  }) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: double.infinity,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          Text(
            'General',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Nombre:'),
          ),
          ListTile(
            title: Text('Edad:'),
          ),
          Text(
            'Profesiones',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Profesión 1:'),
          ),
          ListTile(
            title: Text('Profesión 2:'),
          ),
          ListTile(
            title: Text('Profesión 3:'),
          ),
        ],
      ),
    );
  }
}

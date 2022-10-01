import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:singleton/pages/page1.dart';
import 'package:singleton/pages/page2.dart';

import 'bloc/user/user_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Singleton',
        initialRoute: 'page1',
        routes: {
          'page1': (_) => const Page1(),
          'page2': (_) => const Page2(),
        },
      ),
    );
  }
}

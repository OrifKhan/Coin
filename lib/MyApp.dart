import 'package:cripto_coin/them/themDark.dart';
import 'package:flutter/material.dart';

import 'router/routs.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themDark,
      routes: router,
      initialRoute: mainRouter,
      //   home: const MyHomePage(),
    );
  }
}
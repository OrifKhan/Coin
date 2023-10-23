import 'package:flutter/material.dart';
import '../myHomePage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageScreen();
}

class _MyHomePageScreen extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Center(
              child: Text("Cripto Bitcoin",
                  style: Theme.of(context).textTheme.bodyMedium))),
      body: const ListTitle(),
    );
  }
}

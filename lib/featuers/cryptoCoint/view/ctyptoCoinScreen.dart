import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    setState(() {});
    super.didChangeDependencies();
    assert(args != null && args is String,
        'You must provide String args or You must provide args');

    coinName = args as String;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          coinName ?? "...",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
      body: Center(child: Text('Hello')),
    );
  }
}

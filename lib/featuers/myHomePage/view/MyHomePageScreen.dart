import 'package:cripto_coin/repositories/crytioCoint/crytoCoinRepository.dart';
import 'package:cripto_coin/repositories/model/cryptoCoin.dart';
import 'package:flutter/material.dart';
import '../myHomePage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageScreen();
}

class _MyHomePageScreen extends State<MyHomePage> {
  List<CryptoCoin>? _cryptoListCoin;
  @override
  void initState() {
    _loadCryptoCoin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
          title: Center(
              child:
                  Text("Cripto Bitcoin", style: theme.textTheme.bodyMedium))),
      body: (_cryptoListCoin == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: _cryptoListCoin!.length,
              separatorBuilder: (context, i) => const Divider(),
              itemBuilder: (context, i) {
                final cryptoCoin = _cryptoListCoin![i];
                return ListTitle(
                  cryptoCoin: cryptoCoin,
                );
              },
            ),
    );
  }

  Future<void> _loadCryptoCoin() async {
    _cryptoListCoin = await CrytoCoinRepository().getCointList();
    setState(() {});
  }
}

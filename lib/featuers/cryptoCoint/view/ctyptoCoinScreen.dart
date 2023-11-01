import 'package:cripto_coin/repositories/crytioCoint/coint.dart';
import 'package:flutter/material.dart';

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  CryptoCoin? cryptoCoin;

  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    setState(() {});
    super.didChangeDependencies();
    assert(args != null && args is CryptoCoin,
        'You must provide String args or You must provide args');

    cryptoCoin = args as CryptoCoin;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' '),
      ),
      body: Center(
          child: Column(
        children: [
          Image.network(cryptoCoin!.imagmeUrl),
          Text(
            cryptoCoin!.priceInUSD.toString() ?? "...",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            cryptoCoin!.name ?? "...",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      )),
    );
  }
}

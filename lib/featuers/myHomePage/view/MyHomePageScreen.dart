import 'dart:async';

import 'package:cripto_coin/featuers/bloc/cryptoListBloc.dart';
import 'package:cripto_coin/repositories/crytioCoint/coint.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../myHomePage.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<StatefulWidget> createState() => _MyHomePageScreen();
}

class _MyHomePageScreen extends State<MyHomePage> {
  //List<CryptoCoin>? _cryptoListCoin;
  final _cruptoListBloc = CryptoListBloc(GetIt.I<AbstrctCointRepository>());
  @override
  void initState() {
    _cruptoListBloc.add(LoadCryptoList(null));
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
      body: RefreshIndicator(
          onRefresh: () async {
            final completer = Completer();
            _cruptoListBloc.add(LoadCryptoList(completer));
            return completer.future;
          },
          child: BlocBuilder<CryptoListBloc, CryptoListState>(
            bloc: _cruptoListBloc,
            builder: (context, state) {
              if (state is CryptoListLoaded) {
                return ListView.separated(
                  padding: const EdgeInsets.only(top: 16),
                  itemCount: state.coinList.length,
                  separatorBuilder: (context, i) => const Divider(),
                  itemBuilder: (context, i) {
                    final cryptoCoin = state.coinList[i];
                    return ListTitle(
                      cryptoCoin: cryptoCoin,
                    );
                  },
                );
              }
              if (state is CryptoListLoadingFailure) {
                //   final error=state.exception.toString();
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'А бача итернет надори ку!',
                        style: TextStyle(color: Colors.red),
                      ),
                      const Text(
                        'Итернет даргирону якбори дига проб кун!',
                        style: TextStyle(color: Colors.yellow),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          _cruptoListBloc.add(LoadCryptoList());
                        },
                        child: const Text("як бори дигар"),
                      )
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          )
          // (_cryptoListCoin == null)
          //     ?
          ),
    );
  }
}

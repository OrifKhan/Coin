import 'package:cripto_coin/repositories/model/cryptoCoin.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CrytoCoinRepository {
  Future<List<CryptoCoin>> getCointList() async {
    final response = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final cryptoCionList = data.entries
        .map((e) => CryptoCoin(e.key, (e.value as Map<String, dynamic>)['USD']))
        .toList();
    return cryptoCionList;
  }
}

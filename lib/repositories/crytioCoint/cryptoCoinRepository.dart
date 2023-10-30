import 'package:cripto_coin/repositories/crytioCoint/coint.dart';
import 'package:dio/dio.dart';

class CryptoCoinRepository implements AbstrctCointRepository {
  CryptoCoinRepository({required this.dio});
  final Dio dio;
  @override
  Future<List<CryptoCoin>> getCryptoList() async {
    final response = await dio.get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,1WO,AERGO,AMLT,ANKR,ANT,APIS&tsyms=USD');
    final data = response.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final cryptoCionList = dataRaw.entries.map(
      (e) {
        final usdData = (e.value as Map<String, dynamic>)['USD'];
        final price = usdData['PRICE'];
        final image = usdData['IMAGEURL'];
        return CryptoCoin(
          name: e.key,
          priceInUSD: price,
          imagmeUrl: 'https://www.cryptocompare.com/$image',
        );
      },
    ).toList();

    return cryptoCionList;
  }
}

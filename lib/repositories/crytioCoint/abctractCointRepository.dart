import 'package:cripto_coin/repositories/crytioCoint/model/cryptoCoin.dart';

abstract class AbstrctCointRepository {
  Future<List<CryptoCoin>> getCryptoList();
}

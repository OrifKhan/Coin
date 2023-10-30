import 'package:equatable/equatable.dart';

class CryptoCoin extends Equatable {
  const CryptoCoin({
    required this.name,
    required this.priceInUSD,
    required this.imagmeUrl,
  });
  final String name;
  final double priceInUSD;
  final String imagmeUrl;

  @override
  List<Object?> get props => [name, priceInUSD, imagmeUrl];
}

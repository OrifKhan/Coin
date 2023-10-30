part of 'cryptoListBloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInstal extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoaded extends CryptoListState {
  final List<CryptoCoin> coinList;
  CryptoListLoaded({required this.coinList});

  @override
  List<Object?> get props => [coinList];
}

class CryptoListLoadingFailure extends CryptoListState {
  CryptoListLoadingFailure({required this.exception});
  final Object? exception;

  @override
  List<Object?> get props => [exception];
}

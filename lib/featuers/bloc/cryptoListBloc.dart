import 'dart:async';

import 'package:cripto_coin/repositories/crytioCoint/abctractCointRepository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/crytioCoint/coint.dart';

part 'cryptoListState.dart';
part 'cryptoListEvent.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinRepository) : super(CryptoListInstal()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        if (state is! CryptoListLoaded) {
          emit(CryptoListLoading());
        }
        final coinList = await coinRepository.getCryptoList();
        emit(CryptoListLoaded(coinList: coinList));
      } catch (e) {
        emit(CryptoListLoadingFailure(exception: e));
      } finally {
        event.completer?.complete();
      }
    });
  }
  final AbstrctCointRepository coinRepository;
}

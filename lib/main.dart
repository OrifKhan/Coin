import 'package:cripto_coin/repositories/crytioCoint/coint.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'MyApp.dart';

void main() {
  final talker = TalkerFlutter.init();
  GetIt.I.registerSingleton(talker);
  GetIt.I<Talker>().debug("first debagg lod....");
  GetIt.I.registerLazySingleton<AbstrctCointRepository>(
      () => CryptoCoinRepository(dio: Dio()));
  runApp(const MyApp());
}

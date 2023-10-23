import 'package:flutter/material.dart';

var themDark = ThemeData(
  primarySwatch: Colors.orange,
  primaryColorDark: Colors.black87,
  scaffoldBackgroundColor: Colors.black54,
  appBarTheme: const AppBarTheme(color: Colors.black54)
      .copyWith(iconTheme: const IconThemeData(color: Colors.white)),
  dividerColor: Colors.white30,
  listTileTheme: const ListTileThemeData(iconColor: Colors.white60),
  textTheme: const TextTheme(
      bodyMedium: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
      labelSmall: TextStyle(
          color: Colors.white54, fontSize: 18, fontWeight: FontWeight.w400)),
  useMaterial3: false,
);

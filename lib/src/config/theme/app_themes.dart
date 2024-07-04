import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: appBarTheme()
  );
}

AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: Color(0x8B8B8B)),
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
  );
}

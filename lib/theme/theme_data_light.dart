import 'package:flutter/material.dart';
import 'package:todo_mmd/constants.dart';

ThemeData getThemeDataLight() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFE5E5E5),
    primaryColor: const Color(0xFFFF4444),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFFE5E5E5),
      iconTheme: IconThemeData(
        size: 32,
        color: Color(0xFFFF0000),
      ),
      titleTextStyle: TextStyle(
        color: Color(0xffFA6262),
        fontSize: 32,
        fontWeight: FontWeight.w700,
        fontFamily: 'Arial',
      ),
      actionsIconTheme: IconThemeData(
        color: Color(0xFFD1CDCD),
        size: 32,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFE5E5E5),
      selectedItemColor: Color(0xFFFF4444),
      unselectedItemColor: Color(0xFF000000),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFF4444),
    ),
  );
}

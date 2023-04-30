import 'package:flutter/material.dart';

ThemeData getThemeDataLight() {
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFE5E5E5),
    primaryColor: const Color(0xFFFF4444),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Color(0xFFE5E5E5),
      iconTheme: IconThemeData(
        size: 30,
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
        size: 30,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFFE5E5E5),
      selectedItemColor: Color(0xFFFF4444),
      unselectedItemColor: Color(0xFF000000),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFFF0000).withOpacity(0.68),
    ),
  );
}

import 'package:flutter/material.dart';

ThemeData getThemeDataDark() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.black,
    primaryColor: const Color(0xff2B2727),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Color(0xffFFFFFF), size: 30,),
      titleTextStyle: TextStyle(
        color: Color(0xffFFFFFF),
        fontSize: 32,
        fontWeight: FontWeight.w700,
        fontFamily: 'Arial',
      ),
      actionsIconTheme: IconThemeData(
        color: Color(0xffFFFFFF),
        size: 30,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF0E0D0E),
      selectedItemColor: Color(0xFFFF0000),
      unselectedItemColor: Color(0xFFFFFFFF),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFFBF0000),
    ),
  );
}

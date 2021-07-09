import 'package:flutter/material.dart';

final ThemeData mainTheme = ThemeData(
    unselectedWidgetColor: Color(0xff8D5068),
    primaryColor: Color(0xff8D5068),
    buttonColor: Color(0xff8D5068),
    scaffoldBackgroundColor: Color(0xFFFFFFFF),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff8D5068))),
    ),
    inputDecorationTheme: InputDecorationTheme(fillColor: Color(0xffE8DDE3)));

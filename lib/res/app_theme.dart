import 'package:add_thing_todo/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData light = ThemeData(
      primaryColor: lavender,
      scaffoldBackgroundColor: color121212,
      appBarTheme: const AppBarTheme(
        backgroundColor: color121212,
        elevation: 0,
      ),
      fontFamily: GoogleFonts.lato().fontFamily,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(lavender),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            textStyle: MaterialStateProperty.all(const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400))),
      ));
}

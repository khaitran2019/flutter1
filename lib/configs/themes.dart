import 'package:flashcard1/configs/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final appTheme = ThemeData(
    primaryColor: kRed,
    textTheme: TextTheme(
        bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: GoogleFonts.lato().fontFamily),
        headlineMedium: TextStyle(
          color: Colors.white,
          fontSize: 50,
          fontFamily: GoogleFonts.lato().fontFamily,
          fontWeight: FontWeight.bold,
        )),
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontFamily: GoogleFonts.lato().fontFamily,
          fontSize: 20,
          fontWeight: FontWeight.bold),
      color: kRed,
    ),
    scaffoldBackgroundColor: kYellow);

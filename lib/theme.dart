import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme lightTextTheme = TextTheme(
  bodyLarge: GoogleFonts.openSans(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  ),
  displayLarge: GoogleFonts.openSans(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  ),
  displayMedium: GoogleFonts.openSans(
    fontSize: 21.0,
    fontWeight: FontWeight.w700,
    color: Colors.black,
  ),
  displaySmall: GoogleFonts.openSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
  titleLarge: GoogleFonts.openSans(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  ),
);
//Definisce un oggetto di tipo TextTheme in cui vengono definite le impostazioni per il testo nel tema chiaro. Verrà richiamato nel dark()
TextTheme darkTextTheme = TextTheme(
  bodyLarge: GoogleFonts.openSans(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  ),
  displayLarge: GoogleFonts.openSans(
    fontSize: 32.0,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  ),
  displayMedium: GoogleFonts.openSans(
    fontSize: 21.0,
    fontWeight: FontWeight.w700,
    color: Colors.red,
  ),
  displaySmall: GoogleFonts.openSans(
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
  titleLarge: GoogleFonts.openSans(
    fontSize: 20.0,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  ),
);

//Tema Chiaro. Restituisce un oggetto di tipo ThemeData dove vengono settati tutte le proprietà dei futuri sotto-widget.
ThemeData lightMode() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.grey[200]!.withOpacity(0.5),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateColor.resolveWith((states) {
        return Colors.black;
      }),
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      foregroundColor: Colors.white,
      backgroundColor: Colors.black,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.green,
    ),
    textTheme: lightTextTheme, // Le impostazioni testo definite precedentemente
  );
}

//Tema Scuro. Restituisce un oggetto di tipo ThemeData dove vengono settati tutte le proprietà dei futuri sotto-widget.
ThemeData darkMode() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(41, 45, 51, 1),
    secondaryHeaderColor: Colors.white,
    scaffoldBackgroundColor: const Color.fromRGBO(31, 31, 31, 1),
    iconTheme: const IconThemeData(color: Colors.white),

    textTheme: darkTextTheme, // Le impostazioni testo definite precedentemente
  );
}

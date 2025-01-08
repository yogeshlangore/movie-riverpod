import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextStyle _defaultTextStyle(bool isDark) {
    return GoogleFonts.montserrat(
      color: isDark ? Colors.white : Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.normal,
    );
  }

  static ThemeData themeData({bool isDark = false}) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: isDark 
      ? const Color.fromARGB(255, 30, 29, 29)
      : const Color.fromARGB(255, 239, 231, 231),
      cardColor: isDark
          ? const Color.fromARGB(255, 73, 72, 72)
          : const Color.fromARGB(255, 220, 213, 213),
      appBarTheme: AppBarTheme(
        backgroundColor:
            isDark ? const Color.fromARGB(255, 30, 29, 29) : Colors.white,
        iconTheme: IconThemeData(color: isDark ? Colors.white : Colors.black),
        titleTextStyle: _defaultTextStyle(isDark)
            .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll<Color>(
              isDark ? Colors.white : Colors.black),
        ),
      ),
      textTheme: _textTheme(isDark),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            isDark ? const Color.fromARGB(255, 30, 29, 29) : Colors.white,
        selectedIconTheme:
            IconThemeData(color: isDark ? Colors.white : Colors.black),
        selectedLabelStyle: _defaultTextStyle(isDark)
            .copyWith(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }

  static TextTheme _textTheme(bool isDark) {
    return TextTheme(
      headlineLarge: _defaultTextStyle(isDark)
          .copyWith(fontSize: 24, fontWeight: FontWeight.bold),
      headlineMedium: _defaultTextStyle(isDark)
          .copyWith(fontSize: 20, fontWeight: FontWeight.bold),
      headlineSmall: _defaultTextStyle(isDark)
          .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
      titleLarge: _defaultTextStyle(isDark)
          .copyWith(fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: _defaultTextStyle(isDark)
          .copyWith(fontSize: 24, fontWeight: FontWeight.bold), // font size
      titleSmall: _defaultTextStyle(isDark)
          .copyWith(fontSize: 14, fontWeight: FontWeight.bold),
      displayLarge: _defaultTextStyle(isDark)
          .copyWith(fontSize: 20, fontWeight: FontWeight.normal),
      displayMedium: _defaultTextStyle(isDark)
          .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
      displaySmall: _defaultTextStyle(isDark)
          .copyWith(fontSize: 12, fontWeight: FontWeight.normal),
      bodyLarge: _defaultTextStyle(isDark)
          .copyWith(fontSize: 16, fontWeight: FontWeight.normal),
      bodyMedium: _defaultTextStyle(isDark)
          .copyWith(fontSize: 14, fontWeight: FontWeight.normal),
      bodySmall: _defaultTextStyle(isDark)
          .copyWith(fontSize: 12, fontWeight: FontWeight.normal),
      labelLarge: _defaultTextStyle(isDark)
          .copyWith(fontSize: 22, fontWeight: FontWeight.normal),
      labelMedium: _defaultTextStyle(isDark)
          .copyWith(fontSize: 18, fontWeight: FontWeight.normal),
      labelSmall: _defaultTextStyle(isDark)
          .copyWith(fontSize: 14, fontWeight: FontWeight.normal),
    );
  }
}

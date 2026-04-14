import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Definição da nova paleta Azul
  static const Color primaryBlue = Color(0xFF0D47A1); // Azul Fechado/Profissional
  static const Color accentBlue = Color(0xFF1976D2);
  static const Color backgroundGrey = Color(0xFFF8F9FA);
  static const Color errorRed = Color(0xFFD32F2F);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryBlue,
        primary: primaryBlue,
        secondary: accentBlue,
        error: errorRed,
        surface: Colors.white,
        background: backgroundGrey,
      ),
      textTheme: GoogleFonts.poppinsTextTheme(),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      // Estilização global dos Inputs para combinar com o azul
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryBlue, width: 2),
        ),
      ),
    );
  }
}
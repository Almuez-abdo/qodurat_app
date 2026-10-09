import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFF0F3A5D); // كحلي قدرات
  static const primaryLight = Color(0xFF1A5C8A);
  static const accent = Color(0xFFF2A900); // ذهبي
  static const accentSoft = Color(0xFFFFF3D6);
  static const bg = Color(0xFFF6F8FB);
  static const card = Colors.white;
  static const ink = Color(0xFF1A2433);
  static const muted = Color(0xFF6B7A90);
  static const success = Color(0xFF16A34A);
  static const danger = Color(0xFFE11D48);

  static const gradA = Color(0xFF0F3A5D);
  static const gradB = Color(0xFF1E88C5);
}

class AppTheme {
  static ThemeData light() {
    final base = ThemeData(useMaterial3: true, colorSchemeSeed: AppColors.primary);
    return base.copyWith(
      scaffoldBackgroundColor: AppColors.bg,
      textTheme: GoogleFonts.cairoTextTheme(base.textTheme),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        foregroundColor: AppColors.ink,
      ),
      cardTheme: CardThemeData(
        color: AppColors.card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.grey.shade200)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.grey.shade200)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
    );
  }
}

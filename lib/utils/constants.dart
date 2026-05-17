import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF8B5CF6);
  static const secondary = Color(0xFFEC4899);
  static const accent = Color(0xFF22D3EE);

  static const background = Color(0xFF0F0B1F);
  static const surface = Color(0xFF17122B);
  static const card = Color(0xFF211A3A);
  static const cardAlt = Color(0xFF2B224A);
  static const border = Color(0x33FFFFFF);

  static const textWhite = Colors.white;
  static const textGrey = Color(0xFFB6B0D0);
  static const textMuted = Color(0xFF8B84A7);

  static const success = Color(0xFF22C55E);

  static const LinearGradient appGradient = LinearGradient(
    colors: [
      Color(0xFF1A1333),
      Color(0xFF120F24),
      Color(0xFF0B0917),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroGradient = LinearGradient(
    colors: [
      Color(0xFF8B5CF6),
      Color(0xFFD946EF),
      Color(0xFF22D3EE),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient cardGradient = LinearGradient(
    colors: [
      Color(0xAA2A1F4F),
      Color(0xAA17122B),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

class AppText {
  static const appName = 'Offline Music Player';
}
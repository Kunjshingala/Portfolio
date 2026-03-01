import 'package:flutter/material.dart';

class AppColors {
  // Primary & Background
  static const Color background = Color(0xFFFCFCFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFF000000);
  static const Color secondary = Color(0xFF333333);

  // Text
  static const Color textPrimary = Color(0xFF000000);
  static const Color textSecondary = Color(0xFF757575); // black54 equivalent approx
  static const Color textTertiary = Color(0xFFBDBDBD); // black26 equivalent approx

  // Accents & Borders
  static const Color border = Color(0xFFF0F0F0);
  static const Color borderLight = Color(0xFFF5F5F5);
  static const Color fieldBackground = Color(0xFFF9F9F9);
  static const Color tagBackground = Color(0xFFFAFAFA);

  // Shadows
  static Color shadow = primary.withValues(alpha: 0.05);
  static Color shadowStrong = primary.withValues(alpha: 0.1);

  // Navigation
  static Color navBackground = surface.withValues(alpha: 0.6);
}

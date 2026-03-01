import 'package:flutter/material.dart';

class Responsive {
  Responsive._();

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 600;
  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 && MediaQuery.of(context).size.width < 1024;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= 1024;

  static double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  static double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

  // Helper for fluid typography or sizing
  static double scale(BuildContext context, double baseSize, {double? max}) {
    final width = screenWidth(context);
    var factor = width / 1200; // Base reference width for desktop
    if (factor > 1.0) factor = 1.0;
    if (factor < 0.5) factor = 0.5; // Floor to avoid too small

    final scaled = baseSize * factor;
    if (max != null && scaled > max) return max;
    return scaled;
  }
}

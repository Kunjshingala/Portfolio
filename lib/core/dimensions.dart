class Dimensions {
  Dimensions._();

  // Spacing
  static const double spaceXS = 4.0;
  static const double spaceS = 8.0;
  static const double spaceM = 16.0;
  static const double spaceL = 24.0;
  static const double spaceXL = 32.0;
  static const double spaceXXL = 40.0;
  static const double sectionSpace = 80.0;

  // Radius
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 20.0;
  static const double radiusFull = 100.0;

  // Sizes
  static const double iconS = 16.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double buttonHeight = 54.0;
  static const double maxWidth = 1100.0;

  // Helper for responsive sizing
  static double getResponsiveSize(
    double currentWidth, {
    required double factor,
    required double min,
    required double max,
  }) {
    return (currentWidth * factor).clamp(min, max);
  }
}

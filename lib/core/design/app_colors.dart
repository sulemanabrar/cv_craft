import 'package:flutter/material.dart';

/// Core color tokens for the app UI (not the exported/rendered CV, which has
/// its own print-safe palette resolved from [ResumeStyling]).
abstract final class AppColors {
  // Brand / ink — a deep, confident navy-charcoal rather than a generic blue,
  // to read as "career software" rather than "generic Flutter template".
  static const Color brand = Color(0xFF1C2B4A);
  static const Color brandLight = Color(0xFF35507F);

  // Light theme surfaces
  static const Color lightBackground = Color(0xFFF7F7F5);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceAlt = Color(0xFFF0F1F0);
  static const Color lightBorder = Color(0xFFE2E3E0);
  static const Color lightTextPrimary = Color(0xFF16181D);
  static const Color lightTextSecondary = Color(0xFF5B5F66);
  static const Color lightTextTertiary = Color(0xFF8A8E96);

  // Dark theme surfaces
  static const Color darkBackground = Color(0xFF101216);
  static const Color darkSurface = Color(0xFF181B21);
  static const Color darkSurfaceAlt = Color(0xFF20242C);
  static const Color darkBorder = Color(0xFF2C3038);
  static const Color darkTextPrimary = Color(0xFFF2F3F5);
  static const Color darkTextSecondary = Color(0xFFAEB2BB);
  static const Color darkTextTertiary = Color(0xFF787D87);

  // Semantic
  static const Color success = Color(0xFF1E8E5A);
  static const Color warning = Color(0xFFB4790E);
  static const Color danger = Color(0xFFC13E3E);
  static const Color info = Color(0xFF2D6CDF);

  // ATS badge
  static const Color atsGreen = Color(0xFF1E8E5A);
  static const Color atsGreenSurface = Color(0xFFE4F3EB);
  static const Color atsGreenSurfaceDark = Color(0xFF16301F);
}

/// Professional, print-safe color presets a user can choose for a resume's
/// rendered accent color. Chosen for contrast/readability, not decoration.
enum ResumeColorPreset {
  black('Black', Color(0xFF16181D)),
  navy('Navy', Color(0xFF1C2B4A)),
  blue('Blue', Color(0xFF1F5FA8)),
  darkGreen('Dark Green', Color(0xFF1E5E3D)),
  burgundy('Burgundy', Color(0xFF7A2138)),
  gray('Gray', Color(0xFF4A4E57));

  const ResumeColorPreset(this.label, this.color);

  final String label;
  final Color color;
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App UI typography tokens, built on Fira Sans — the same family used by
/// the ATS Classic / Modern resume templates, so the product has one
/// coherent typographic identity from dashboard to exported PDF.
abstract final class AppTypography {
  static TextTheme textTheme(Color baseColor) {
    final base = GoogleFonts.firaSansTextTheme();
    return base
        .copyWith(
          displaySmall: base.displaySmall?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.5,
          ),
          headlineMedium: base.headlineMedium?.copyWith(
            fontWeight: FontWeight.w600,
            letterSpacing: -0.3,
          ),
          headlineSmall: base.headlineSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          titleLarge: base.titleLarge?.copyWith(fontWeight: FontWeight.w600),
          titleMedium: base.titleMedium?.copyWith(fontWeight: FontWeight.w600),
          titleSmall: base.titleSmall?.copyWith(fontWeight: FontWeight.w500),
          bodyLarge: base.bodyLarge?.copyWith(height: 1.45),
          bodyMedium: base.bodyMedium?.copyWith(height: 1.45),
          labelLarge: base.labelLarge?.copyWith(fontWeight: FontWeight.w600),
        )
        .apply(bodyColor: baseColor, displayColor: baseColor);
  }
}

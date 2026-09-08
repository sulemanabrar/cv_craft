import 'package:flutter/material.dart';

/// Shadow tokens. Kept deliberately subtle — the spec explicitly warns
/// against "excessive shadows" reading as a generic template.
abstract final class AppShadows {
  static List<BoxShadow> card(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.32),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ];
    }
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.06),
        blurRadius: 10,
        offset: const Offset(0, 2),
      ),
    ];
  }

  static List<BoxShadow> raised(Brightness brightness) {
    if (brightness == Brightness.dark) {
      return [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.4),
          blurRadius: 20,
          offset: const Offset(0, 8),
        ),
      ];
    }
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.10),
        blurRadius: 18,
        offset: const Offset(0, 6),
      ),
    ];
  }
}

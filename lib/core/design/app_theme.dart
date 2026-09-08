import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

abstract final class AppTheme {
  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.brand,
      brightness: Brightness.light,
      primary: AppColors.brand,
      surface: AppColors.lightSurface,
    );
    return _base(
      colorScheme: colorScheme,
      background: AppColors.lightBackground,
      surfaceAlt: AppColors.lightSurfaceAlt,
      border: AppColors.lightBorder,
      textPrimary: AppColors.lightTextPrimary,
      textSecondary: AppColors.lightTextSecondary,
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.brandLight,
      brightness: Brightness.dark,
      primary: AppColors.brandLight,
      surface: AppColors.darkSurface,
    );
    return _base(
      colorScheme: colorScheme,
      background: AppColors.darkBackground,
      surfaceAlt: AppColors.darkSurfaceAlt,
      border: AppColors.darkBorder,
      textPrimary: AppColors.darkTextPrimary,
      textSecondary: AppColors.darkTextSecondary,
    );
  }

  static ThemeData _base({
    required ColorScheme colorScheme,
    required Color background,
    required Color surfaceAlt,
    required Color border,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    final textTheme = AppTypography.textTheme(textPrimary);
    return ThemeData(
      useMaterial3: true,
      brightness: colorScheme.brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      textTheme: textTheme,
      splashFactory: InkSparkle.splashFactory,
      dividerColor: border,
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(color: border),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: surfaceAlt,
        labelStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w500),
        side: BorderSide(color: border),
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceAlt,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.sm,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary, width: 1.6),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.danger),
        ),
        labelStyle: TextStyle(color: textSecondary),
        hintStyle: TextStyle(color: textSecondary.withValues(alpha: 0.7)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: surfaceAlt,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm + 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: textTheme.labelLarge,
          minimumSize: const Size(0, 48),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: textPrimary,
          side: BorderSide(color: border),
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.sm + 2,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: textTheme.labelLarge,
          minimumSize: const Size(0, 48),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: textTheme.labelLarge,
          minimumSize: const Size(0, 44),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        surfaceTintColor: Colors.transparent,
        indicatorColor: colorScheme.primary.withValues(alpha: 0.14),
        labelTextStyle: WidgetStatePropertyAll(
          textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      switchTheme: SwitchThemeData(
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? colorScheme.primary
              : surfaceAlt,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: textPrimary,
        contentTextStyle: TextStyle(color: background),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}

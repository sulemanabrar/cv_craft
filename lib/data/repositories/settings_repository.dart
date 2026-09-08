import 'package:flutter/material.dart';

abstract class SettingsRepository {
  ThemeMode getThemeMode();
  Future<void> setThemeMode(ThemeMode mode);

  bool isOnboardingSeen();
  Future<void> setOnboardingSeen(bool seen);

  String? getLastUsedTemplateId();
  Future<void> setLastUsedTemplateId(String templateId);
}

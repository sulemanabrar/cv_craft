import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'settings_repository.dart';

class HiveSettingsRepository implements SettingsRepository {
  HiveSettingsRepository(this._box);

  static const String boxName = 'settings';

  static const String _themeModeKey = 'themeMode';
  static const String _onboardingSeenKey = 'onboardingSeen';
  static const String _lastUsedTemplateIdKey = 'lastUsedTemplateId';

  final Box _box;

  @override
  ThemeMode getThemeMode() {
    final value = _box.get(_themeModeKey) as String?;
    return ThemeMode.values.firstWhere(
      (m) => m.name == value,
      orElse: () => ThemeMode.system,
    );
  }

  @override
  Future<void> setThemeMode(ThemeMode mode) async {
    await _box.put(_themeModeKey, mode.name);
  }

  @override
  bool isOnboardingSeen() => (_box.get(_onboardingSeenKey) as bool?) ?? false;

  @override
  Future<void> setOnboardingSeen(bool seen) async {
    await _box.put(_onboardingSeenKey, seen);
  }

  @override
  String? getLastUsedTemplateId() => _box.get(_lastUsedTemplateIdKey) as String?;

  @override
  Future<void> setLastUsedTemplateId(String templateId) async {
    await _box.put(_lastUsedTemplateIdKey, templateId);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

class ThemeModeController extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ref.read(settingsRepositoryProvider).getThemeMode();

  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    await ref.read(settingsRepositoryProvider).setThemeMode(mode);
  }
}

final themeModeProvider = NotifierProvider<ThemeModeController, ThemeMode>(
  ThemeModeController.new,
);

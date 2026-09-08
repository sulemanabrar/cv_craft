import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../data/repositories/hive_resume_repository.dart';
import '../data/repositories/hive_settings_repository.dart';
import '../data/repositories/resume_repository.dart';
import '../data/repositories/settings_repository.dart';
import '../data/services/crash_reporting_service.dart';

/// Overridden in `main()` with the real, already-opened Hive boxes before
/// `runApp` — every other provider below builds on top of these.
final resumesBoxProvider = Provider<Box<Map>>((ref) {
  throw UnimplementedError('resumesBoxProvider must be overridden in main()');
});

final settingsBoxProvider = Provider<Box>((ref) {
  throw UnimplementedError('settingsBoxProvider must be overridden in main()');
});

/// Overridden in `main()` with the instance already wired into
/// `FlutterError.onError` / `PlatformDispatcher.onError` before `runApp`.
final crashReportingServiceProvider = Provider<CrashReportingService>((ref) {
  throw UnimplementedError('crashReportingServiceProvider must be overridden in main()');
});

final resumeRepositoryProvider = Provider<ResumeRepository>((ref) {
  return HiveResumeRepository(ref.watch(resumesBoxProvider));
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return HiveSettingsRepository(ref.watch(settingsBoxProvider));
});

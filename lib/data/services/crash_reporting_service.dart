import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

abstract interface class CrashReportingService {
  Future<void> recordError(Object error, StackTrace? stackTrace, {bool fatal = false});
  Future<void> recordFlutterError(FlutterErrorDetails details);
  Future<void> log(String message);
  Future<void> setUserId(String? userId);
}

class FirebaseCrashReportingService implements CrashReportingService {
  FirebaseCrashReportingService({FirebaseCrashlytics? crashlytics})
      : _crashlytics = crashlytics ?? FirebaseCrashlytics.instance {
    // Debug builds stay noisy locally instead of polluting the dashboard.
    _crashlytics.setCrashlyticsCollectionEnabled(!kDebugMode);
  }

  final FirebaseCrashlytics _crashlytics;

  @override
  Future<void> recordError(Object error, StackTrace? stackTrace, {bool fatal = false}) {
    return _crashlytics.recordError(error, stackTrace, fatal: fatal);
  }

  @override
  Future<void> recordFlutterError(FlutterErrorDetails details) {
    return _crashlytics.recordFlutterError(details);
  }

  @override
  Future<void> log(String message) {
    return _crashlytics.log(message);
  }

  @override
  Future<void> setUserId(String? userId) {
    return _crashlytics.setUserIdentifier(userId ?? '');
  }
}

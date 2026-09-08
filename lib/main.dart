import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'data/repositories/hive_resume_repository.dart';
import 'data/repositories/hive_settings_repository.dart';
import 'firebase_options.dart';
import 'state/providers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Hive.initFlutter();
  final resumesBox = await Hive.openBox<Map>(HiveResumeRepository.boxName);
  final settingsBox = await Hive.openBox(HiveSettingsRepository.boxName);

  runApp(
    ProviderScope(
      overrides: [
        resumesBoxProvider.overrideWithValue(resumesBox),
        settingsBoxProvider.overrideWithValue(settingsBox),
      ],
      child: const CvMakerApp(),
    ),
  );
}

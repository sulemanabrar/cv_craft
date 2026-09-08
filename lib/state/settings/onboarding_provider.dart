import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

class OnboardingSeenController extends Notifier<bool> {
  @override
  bool build() => ref.read(settingsRepositoryProvider).isOnboardingSeen();

  Future<void> markSeen() async {
    state = true;
    await ref.read(settingsRepositoryProvider).setOnboardingSeen(true);
  }
}

final onboardingSeenProvider = NotifierProvider<OnboardingSeenController, bool>(
  OnboardingSeenController.new,
);

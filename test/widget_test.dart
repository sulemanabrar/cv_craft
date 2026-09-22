import 'package:cv_maker/app.dart';
import 'package:cv_maker/data/repositories/auth_repository.dart';
import 'package:cv_maker/data/models/resume.dart';
import 'package:cv_maker/data/repositories/resume_repository.dart';
import 'package:cv_maker/data/repositories/settings_repository.dart';
import 'package:cv_maker/state/auth/auth_provider.dart';
import 'package:cv_maker/state/providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

class _FakeAuthRepository implements AuthRepository {
  final _mockAuth = MockFirebaseAuth(
    mockUser: MockUser(uid: 'test-uid', email: 'test@example.com'),
    signedIn: true,
  );

  @override
  Stream<User?> authStateChanges() => _mockAuth.authStateChanges();
  @override
  User? get currentUser => _mockAuth.currentUser;
  @override
  Future<void> signInWithEmail({required String email, required String password}) async {}
  @override
  Future<void> signUpWithEmail({required String email, required String password}) async {}
  @override
  Future<void> signInWithGoogle() async {}
  @override
  Future<void> sendPasswordResetEmail(String email) async {}
  @override
  Future<void> signOut() async {}
  @override
  Future<void> deleteAccount() async {}
  @override
  Future<void> reauthenticateWithPassword(String password) async {}
  @override
  Future<void> reauthenticateWithGoogle() async {}
}

class _FakeResumeRepository implements ResumeRepository {
  @override
  Future<List<Resume>> getAll() async => [];
  @override
  Future<Resume?> getById(String id) async => null;
  @override
  Future<void> save(Resume resume) async {}
  @override
  Future<void> delete(String id) async {}
}

class _FakeSettingsRepository implements SettingsRepository {
  @override
  ThemeMode getThemeMode() => ThemeMode.system;
  @override
  Future<void> setThemeMode(ThemeMode mode) async {}
  @override
  bool isOnboardingSeen() => false;
  @override
  Future<void> setOnboardingSeen(bool seen) async {}
  @override
  String? getLastUsedTemplateId() => null;
  @override
  Future<void> setLastUsedTemplateId(String templateId) async {}
}

void main() {
  setUpAll(() {
    // Never touch the network or a platform file-cache channel in tests.
    GoogleFonts.config.allowRuntimeFetching = false;
  });

  testWidgets('App boots to the onboarding screen', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          resumeRepositoryProvider.overrideWithValue(_FakeResumeRepository()),
          settingsRepositoryProvider.overrideWithValue(_FakeSettingsRepository()),
          authRepositoryProvider.overrideWithValue(_FakeAuthRepository()),
        ],
        child: const CvMakerApp(),
      ),
    );
    // Avoid pumpAndSettle: onboarding's page-indicator dots use an ongoing
    // animation that never fully settles.
    for (var i = 0; i < 5; i++) {
      await tester.pump(const Duration(milliseconds: 100));
    }

    expect(find.text('Skip'), findsOneWidget);
    expect(find.text('Build your professional future.'), findsOneWidget);
  });
}

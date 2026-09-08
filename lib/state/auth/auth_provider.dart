import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/auth_repository.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return FirebaseAuthRepository();
});

/// Emits the current signed-in [User], or `null` when signed out.
///
/// The router watches this to decide whether to show the auth flow or the
/// main app, so it stays loading (no value yet) only until Firebase resolves
/// any persisted session on startup.
final authStateChangesProvider = StreamProvider<User?>((ref) {
  return ref.watch(authRepositoryProvider).authStateChanges();
});

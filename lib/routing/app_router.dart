import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/route_paths.dart';
import '../features/auth/login_screen.dart';
import '../features/auth/signup_screen.dart';
import '../features/auth/splash_screen.dart';
import '../features/editor/full_preview_screen.dart';
import '../features/editor/resume_editor_screen.dart';
import '../features/home/home_screen.dart';
import '../features/my_cvs/my_cvs_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/templates/template_detail_screen.dart';
import '../features/templates/templates_gallery_screen.dart';
import '../state/auth/auth_provider.dart';
import '../state/providers.dart';
import 'scaffold_with_nav.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final onboardingSeen = ref.read(settingsRepositoryProvider).isOnboardingSeen();
  final authState = ref.watch(authStateChangesProvider);

  return GoRouter(
    initialLocation: RoutePaths.splash,
    redirect: (context, state) {
      final loc = state.matchedLocation;

      if (authState.isLoading) {
        return loc == RoutePaths.splash ? null : RoutePaths.splash;
      }

      final loggedIn = authState.value != null;
      final onAuthPage = loc == RoutePaths.login || loc == RoutePaths.signup;

      if (!loggedIn) {
        return onAuthPage ? null : RoutePaths.login;
      }

      if (onAuthPage || loc == RoutePaths.splash) {
        return onboardingSeen ? RoutePaths.home : RoutePaths.onboarding;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RoutePaths.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RoutePaths.signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: RoutePaths.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: RoutePaths.createFlow,
        builder: (context, state) => const TemplatesGalleryScreen(
          basePath: RoutePaths.createFlow,
          title: 'Choose a Template',
          showAppBar: true,
        ),
        routes: [
          GoRoute(
            path: RoutePaths.createFlowTemplateDetail,
            builder: (context, state) => TemplateDetailScreen(
              templateId: state.pathParameters['templateId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.editor,
        builder: (context, state) => ResumeEditorScreen(
          resumeId: state.pathParameters['resumeId']!,
        ),
        routes: [
          GoRoute(
            path: RoutePaths.preview,
            builder: (context, state) => FullPreviewScreen(
              resumeId: state.pathParameters['resumeId']!,
            ),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            ScaffoldWithNav(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(routes: [
            GoRoute(path: RoutePaths.home, builder: (context, state) => const HomeScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: RoutePaths.myCvs, builder: (context, state) => const MyCvsScreen()),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(
              path: RoutePaths.templates,
              builder: (context, state) => const TemplatesGalleryScreen(
                basePath: '/templates',
                title: 'Templates',
                showAppBar: true,
              ),
              routes: [
                GoRoute(
                  path: RoutePaths.templateDetail,
                  builder: (context, state) => TemplateDetailScreen(
                    templateId: state.pathParameters['templateId']!,
                  ),
                ),
              ],
            ),
          ]),
          StatefulShellBranch(routes: [
            GoRoute(path: RoutePaths.profile, builder: (context, state) => const ProfileScreen()),
          ]),
        ],
      ),
    ],
  );
});

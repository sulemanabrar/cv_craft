/// Route path constants for go_router.
abstract final class RoutePaths {
  static const String splash = '/splash';
  static const String login = '/login';
  static const String signup = '/signup';

  static const String onboarding = '/onboarding';

  static const String home = '/home';
  static const String myCvs = '/my-cvs';
  static const String templates = '/templates';
  static const String profile = '/profile';

  static const String templateDetail = 'template/:templateId';
  static const String editor = '/editor/:resumeId';
  static const String preview = 'preview';

  /// The "Create New CV" flow — a top-level push (outside the bottom-nav
  /// shell) reusing the Templates gallery/detail screens, so the back
  /// button returns exactly to wherever "Create New CV" was tapped from.
  static const String createFlow = '/create';
  static const String createFlowTemplateDetail = 'template/:templateId';

  static String templateDetailPath(String templateId) =>
      '/templates/template/$templateId';

  static String createFlowTemplateDetailPath(String templateId) =>
      '/create/template/$templateId';

  static String editorPath(String resumeId) => '/editor/$resumeId';

  static String previewPath(String resumeId) => '/editor/$resumeId/preview';
}

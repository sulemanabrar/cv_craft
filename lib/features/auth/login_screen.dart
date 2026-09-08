import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/route_paths.dart';
import '../../core/design/app_spacing.dart';
import '../../core/design/widgets/app_text_field.dart';
import '../../core/design/widgets/primary_button.dart';
import '../../data/repositories/auth_repository.dart';
import '../../state/auth/auth_provider.dart';
import 'widgets/google_sign_in_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _submitting = false;
  bool _googleSubmitting = false;
  String? _errorText;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      setState(() => _errorText = 'Enter your email and password.');
      return;
    }

    setState(() {
      _submitting = true;
      _errorText = null;
    });

    try {
      await ref.read(authRepositoryProvider).signInWithEmail(email: email, password: password);
    } on AuthException catch (e) {
      if (mounted) setState(() => _errorText = e.message);
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  Future<void> _submitWithGoogle() async {
    setState(() {
      _googleSubmitting = true;
      _errorText = null;
    });

    try {
      await ref.read(authRepositoryProvider).signInWithGoogle();
    } on AuthException catch (e) {
      if (mounted) setState(() => _errorText = e.message);
    } finally {
      if (mounted) setState(() => _googleSubmitting = false);
    }
  }

  Future<void> _forgotPassword() async {
    final email = _emailController.text.trim();
    if (email.isEmpty) {
      setState(() => _errorText = 'Enter your email above first, then tap "Forgot password?".');
      return;
    }

    try {
      await ref.read(authRepositoryProvider).sendPasswordResetEmail(email);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password reset email sent to $email.')),
        );
      }
    } on AuthException catch (e) {
      if (mounted) setState(() => _errorText = e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final busy = _submitting || _googleSubmitting;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.description_outlined, size: 40, color: theme.colorScheme.primary),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    'Welcome back',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.headlineSmall,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    'Sign in to continue building your CV.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xxl),
                  AppTextField(
                    controller: _emailController,
                    label: 'Email',
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  AppTextField(
                    controller: _passwordController,
                    label: 'Password',
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => _submit(),
                    errorText: _errorText,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: busy ? null : _forgotPassword,
                      child: const Text('Forgot password?'),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  PrimaryButton(
                    label: 'Sign In',
                    expand: true,
                    loading: _submitting,
                    onPressed: busy ? null : _submit,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Row(
                    children: [
                      Expanded(child: Divider(color: theme.colorScheme.outlineVariant)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                        child: Text('or', style: theme.textTheme.bodySmall),
                      ),
                      Expanded(child: Divider(color: theme.colorScheme.outlineVariant)),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  GoogleSignInButton(
                    loading: _googleSubmitting,
                    onPressed: busy ? null : _submitWithGoogle,
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                        onPressed: busy ? null : () => context.go(RoutePaths.signup),
                        child: const Text('Sign up'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

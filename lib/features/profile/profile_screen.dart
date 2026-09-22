import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/legal_links.dart';
import '../../core/design/app_spacing.dart';
import '../../data/repositories/auth_repository.dart';
import '../../state/auth/auth_provider.dart';
import '../../state/settings/theme_mode_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  bool _isDeleting = false;

  Future<void> _confirmSignOut(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sign out?'),
        content: const Text('You can sign back in anytime with the same account.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Sign out')),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(authRepositoryProvider).signOut();
    }
  }

  Future<void> _openPrivacyPolicy() async {
    await launchUrl(Uri.parse(privacyPolicyUrl), mode: LaunchMode.externalApplication);
  }

  Future<void> _openAccountDeletionInfo() async {
    await launchUrl(Uri.parse(accountDeletionInfoUrl), mode: LaunchMode.externalApplication);
  }

  Future<void> _confirmDeleteAccount(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete account?'),
        content: const Text(
          "This permanently deletes your account and signs you out. This can't be undone.",
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    setState(() => _isDeleting = true);
    try {
      await _deleteAccountWithReauth(context, ref);
    } on AuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
      }
    } finally {
      if (mounted) setState(() => _isDeleting = false);
    }
  }

  Future<void> _deleteAccountWithReauth(BuildContext context, WidgetRef ref) async {
    final authRepository = ref.read(authRepositoryProvider);
    try {
      await authRepository.deleteAccount();
      return;
    } on ReauthRequiredException {
      // Fall through to reauthenticate below.
    }

    final user = authRepository.currentUser;
    final usesGoogle = user?.providerData.any((p) => p.providerId == 'google.com') ?? false;

    if (usesGoogle) {
      await authRepository.reauthenticateWithGoogle();
    } else {
      if (!context.mounted) return;
      final password = await _promptPassword(context);
      if (password == null) return;
      await authRepository.reauthenticateWithPassword(password);
    }

    await authRepository.deleteAccount();
  }

  Future<String?> _promptPassword(BuildContext context) async {
    final controller = TextEditingController();
    final password = await showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Confirm your password'),
        content: TextField(
          controller: controller,
          obscureText: true,
          autofocus: true,
          decoration: const InputDecoration(labelText: 'Password'),
          onSubmitted: (value) => Navigator.pop(context, value),
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(context, controller.text),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
    controller.dispose();
    return (password == null || password.isEmpty) ? null : password;
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final user = ref.watch(authStateChangesProvider).value;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text('Account', style: theme.textTheme.titleSmall),
            const SizedBox(height: AppSpacing.xs),
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_circle_outlined),
                    title: Text(user?.displayName ?? user?.email ?? 'Signed in'),
                    subtitle: user?.displayName != null ? Text(user!.email ?? '') : null,
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.logout_rounded, color: theme.colorScheme.error),
                    title: Text('Sign out', style: TextStyle(color: theme.colorScheme.error)),
                    onTap: () => _confirmSignOut(context, ref),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: _isDeleting
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : Icon(Icons.delete_forever_rounded, color: theme.colorScheme.error),
                    title: Text('Delete account', style: TextStyle(color: theme.colorScheme.error)),
                    enabled: !_isDeleting,
                    onTap: _isDeleting ? null : () => _confirmDeleteAccount(context, ref),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('Appearance', style: theme.textTheme.titleSmall),
            const SizedBox(height: AppSpacing.xs),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: SegmentedButton<ThemeMode>(
                  segments: const [
                    ButtonSegment(value: ThemeMode.system, label: Text('System'), icon: Icon(Icons.brightness_auto_outlined)),
                    ButtonSegment(value: ThemeMode.light, label: Text('Light'), icon: Icon(Icons.light_mode_outlined)),
                    ButtonSegment(value: ThemeMode.dark, label: Text('Dark'), icon: Icon(Icons.dark_mode_outlined)),
                  ],
                  selected: {themeMode},
                  onSelectionChanged: (selection) =>
                      ref.read(themeModeProvider.notifier).setThemeMode(selection.first),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('About', style: theme.textTheme.titleSmall),
            const SizedBox(height: AppSpacing.xs),
            Card(
              child: Column(
                children: [
                  const ListTile(
                    leading: Icon(Icons.lock_outline_rounded),
                    title: Text('Your data stays on this device'),
                    subtitle: Text('CVs are stored locally — nothing is uploaded to a server.'),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.privacy_tip_outlined),
                    title: const Text('Privacy Policy'),
                    trailing: const Icon(Icons.open_in_new_rounded, size: 18),
                    onTap: _openPrivacyPolicy,
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.no_accounts_outlined),
                    title: const Text('Delete Account & Data'),
                    trailing: const Icon(Icons.open_in_new_rounded, size: 18),
                    onTap: _openAccountDeletionInfo,
                  ),
                  const Divider(height: 1),
                  const ListTile(
                    leading: Icon(Icons.info_outline_rounded),
                    title: Text('CV Maker'),
                    subtitle: Text('Version 1.0.0'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

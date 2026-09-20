import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/constants/legal_links.dart';
import '../../core/design/app_spacing.dart';
import '../../state/auth/auth_provider.dart';
import '../../state/settings/theme_mode_provider.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

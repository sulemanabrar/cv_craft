import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/route_paths.dart';
import '../../core/design/app_spacing.dart';
import '../../core/design/widgets/empty_state.dart';
import '../../core/design/widgets/primary_button.dart';
import '../../core/design/widgets/skeleton_loader.dart';
import '../../state/resume_list/resume_list_provider.dart';
import 'widgets/quick_action_tile.dart';
import 'widgets/recent_cv_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 18) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resumesAsync = ref.watch(resumeListProvider);
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () => ref.refresh(resumeListProvider.future),
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.xxxl,
            ),
            children: [
              Text(_greeting(), style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              )),
              const SizedBox(height: AppSpacing.xxs),
              Text('Build a CV that gets noticed.', style: theme.textTheme.headlineSmall),
              const SizedBox(height: AppSpacing.xxs),
              Text(
                'Create a professional, ATS-friendly resume in minutes.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: '+ Create New CV',
                expand: true,
                onPressed: () => context.push(RoutePaths.createFlow),
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Expanded(
                    child: QuickActionTile(
                      icon: Icons.dashboard_customize_outlined,
                      label: 'Browse Templates',
                      onTap: () => context.go(RoutePaths.templates),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: QuickActionTile(
                      icon: Icons.upload_file_outlined,
                      label: 'Import Existing CV',
                      onTap: () => _showComingSoon(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl),
              resumesAsync.when(
                loading: () => const _HomeLoadingSkeleton(),
                error: (_, _) => EmptyState(
                  icon: Icons.error_outline_rounded,
                  title: "Couldn't load your CVs",
                  message: 'Please try again.',
                  actionLabel: 'Retry',
                  onAction: () => ref.invalidate(resumeListProvider),
                ),
                data: (resumes) {
                  if (resumes.isEmpty) {
                    return EmptyState(
                      icon: Icons.description_outlined,
                      title: 'No CVs yet',
                      message: 'Create your first resume to get started.',
                      actionLabel: 'Create New CV',
                      onAction: () => context.push(RoutePaths.createFlow),
                    );
                  }
                  final recent = resumes.take(6).toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Recent CVs', style: theme.textTheme.titleMedium),
                          Text(
                            '${resumes.length} total',
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      SizedBox(
                        height: 232,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: recent.length,
                          separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
                          itemBuilder: (context, index) {
                            final resume = recent[index];
                            return RecentCvCard(
                              resume: resume,
                              onTap: () => context.push(RoutePaths.editorPath(resume.id)),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Import Existing CV'),
        content: const Text(
          "Importing an existing resume file is coming in a future update. "
          "For now, you can create a new CV and fill it in — it only takes a few minutes.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Got it'),
          ),
        ],
      ),
    );
  }
}

class _HomeLoadingSkeleton extends StatelessWidget {
  const _HomeLoadingSkeleton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: SkeletonLoader(height: 180)),
        SizedBox(width: AppSpacing.sm),
        Expanded(child: SkeletonLoader(height: 180)),
      ],
    );
  }
}

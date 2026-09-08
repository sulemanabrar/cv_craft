import 'package:flutter/material.dart';

import '../app_spacing.dart';

/// A purpose-built empty state — used instead of ever showing a bare blank
/// form or list.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
    this.compact = false,
  });

  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: compact ? AppSpacing.lg : AppSpacing.xxl, horizontal: AppSpacing.lg),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: theme.colorScheme.primary, size: 24),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(title, style: theme.textTheme.titleSmall, textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.xxs),
          Text(
            message,
            style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: AppSpacing.md),
            OutlinedButton.icon(
              onPressed: onAction,
              icon: const Icon(Icons.add_rounded, size: 18),
              label: Text(actionLabel!),
            ),
          ],
        ],
      ),
    );
  }
}

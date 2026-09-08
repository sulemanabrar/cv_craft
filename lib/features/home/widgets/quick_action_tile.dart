import 'package:flutter/material.dart';

import '../../../core/design/app_spacing.dart';

class QuickActionTile extends StatelessWidget {
  const QuickActionTile({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.sm),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: theme.colorScheme.primary),
              const SizedBox(height: AppSpacing.xs),
              Text(
                label,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

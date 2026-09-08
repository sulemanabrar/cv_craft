import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../app_spacing.dart';

class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.label,
    this.color,
    this.backgroundColor,
    this.icon,
  });

  const AppBadge.atsFriendly({super.key})
      : label = 'ATS Friendly',
        color = AppColors.atsGreen,
        backgroundColor = AppColors.atsGreenSurface,
        icon = Icons.check_circle_rounded;

  final String label;
  final Color? color;
  final Color? backgroundColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final fg = color ?? theme.colorScheme.primary;
    final bg = backgroundColor ?? theme.colorScheme.primary.withValues(alpha: 0.1);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs + 2, vertical: 3),
      decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(AppRadius.pill)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: fg),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(color: fg, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}

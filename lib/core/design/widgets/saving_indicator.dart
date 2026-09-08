import 'package:flutter/material.dart';

import '../../constants/saving_state.dart';
import '../app_colors.dart';

/// The subtle "Saving… / All changes saved" pill shown in the editor's app
/// bar, driven by [SavingState] — so the user never has to wonder whether
/// their edit was persisted.
class SavingIndicator extends StatelessWidget {
  const SavingIndicator({super.key, required this.state});

  final SavingState state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    late final String label;
    late final Widget icon;
    late final Color color;

    switch (state) {
      case SavingState.idle:
        return const SizedBox.shrink();
      case SavingState.saving:
        label = 'Saving…';
        color = theme.colorScheme.onSurfaceVariant;
        icon = SizedBox(
          width: 12,
          height: 12,
          child: CircularProgressIndicator(strokeWidth: 1.8, color: color),
        );
        break;
      case SavingState.saved:
        label = 'All changes saved';
        color = AppColors.success;
        icon = Icon(Icons.check_circle_rounded, size: 14, color: color);
        break;
      case SavingState.error:
        label = "Couldn't save";
        color = AppColors.danger;
        icon = Icon(Icons.error_rounded, size: 14, color: color);
        break;
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        icon,
        const SizedBox(width: 6),
        Text(label, style: theme.textTheme.labelSmall?.copyWith(color: color)),
      ],
    );
  }
}

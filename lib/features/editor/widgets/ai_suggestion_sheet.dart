import 'package:flutter/material.dart';

import '../../../core/design/app_spacing.dart';
import '../../../core/design/widgets/app_bottom_sheet.dart';
import '../../../core/design/widgets/primary_button.dart';

/// Shows a loading state while [load] resolves, then the suggested text
/// with "Use Suggestion" / "Keep My Version" — AI output is never applied
/// automatically. Returns the suggestion if the user chose to use it, or
/// null if they kept their own version / cancelled.
Future<String?> showAiTextSuggestionSheet({
  required BuildContext context,
  required String title,
  required Future<String> Function() load,
}) {
  return showAppBottomSheet<String>(
    context: context,
    title: title,
    builder: (context) => _AiTextSuggestion(load: load),
  );
}

class _AiTextSuggestion extends StatefulWidget {
  const _AiTextSuggestion({required this.load});

  final Future<String> Function() load;

  @override
  State<_AiTextSuggestion> createState() => _AiTextSuggestionState();
}

class _AiTextSuggestionState extends State<_AiTextSuggestion> {
  late final Future<String> _future = widget.load();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FutureBuilder<String>(
      future: _future,
      builder: (context, snapshot) {
        if (!snapshot.hasData && !snapshot.hasError) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: AppSpacing.md),
                  Text('Thinking…'),
                ],
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Couldn't generate a suggestion.", style: theme.textTheme.bodyMedium),
              const SizedBox(height: AppSpacing.md),
              PrimaryButton(
                label: 'Close',
                expand: true,
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          );
        }
        final suggestion = snapshot.data!;
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppSpacing.md),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.2)),
              ),
              child: Text(suggestion, style: theme.textTheme.bodyMedium),
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Keep My Version'),
                  ),
                ),
                const SizedBox(width: AppSpacing.sm),
                Expanded(
                  child: FilledButton(
                    onPressed: () => Navigator.of(context).pop(suggestion),
                    child: const Text('Use Suggestion'),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

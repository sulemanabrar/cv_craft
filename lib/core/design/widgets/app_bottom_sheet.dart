import 'package:flutter/material.dart';

import '../app_spacing.dart';

/// Shows a scrollable, rounded-top modal bottom sheet with consistent
/// chrome (drag handle, title, close button) so every sheet in the app
/// looks like part of the same product.
Future<T?> showAppBottomSheet<T>({
  required BuildContext context,
  required String title,
  required WidgetBuilder builder,
  bool isScrollControlled = true,
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: isScrollControlled,
    useSafeArea: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
          initialChildSize: 0.75,
          minChildSize: 0.4,
          maxChildSize: 0.95,
          expand: false,
          builder: (context, scrollController) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: AppSpacing.sm),
                Container(
                  width: 36,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Theme.of(context).dividerColor,
                    borderRadius: BorderRadius.circular(AppRadius.pill),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.md,
                    AppSpacing.sm,
                    AppSpacing.xs,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(title, style: Theme.of(context).textTheme.titleMedium),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close_rounded),
                        onPressed: () => Navigator.of(context).maybePop(),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.lg,
                      0,
                      AppSpacing.lg,
                      AppSpacing.lg,
                    ),
                    child: Builder(builder: builder),
                  ),
                ),
              ],
            );
          },
        ),
      );
    },
  );
}

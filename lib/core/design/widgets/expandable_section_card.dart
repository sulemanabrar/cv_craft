import 'package:flutter/material.dart';

import '../app_spacing.dart';

/// The accordion card every top-level resume section renders as in the
/// editor. Deliberately plain (subtle border, no heavy shadow) per the
/// product's "sophisticated, not template-y" design direction.
class ExpandableSectionCard extends StatefulWidget {
  const ExpandableSectionCard({
    super.key,
    required this.icon,
    required this.title,
    required this.child,
    this.subtitle,
    this.trailing,
    this.initiallyExpanded = false,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget child;
  final Widget? trailing;
  final bool initiallyExpanded;

  @override
  State<ExpandableSectionCard> createState() => _ExpandableSectionCardState();
}

class _ExpandableSectionCardState extends State<ExpandableSectionCard> {
  late bool _expanded = widget.initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () => setState(() => _expanded = !_expanded),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: AppSpacing.sm + 2,
              ),
              child: Row(
                children: [
                  Icon(widget.icon, size: 20, color: theme.colorScheme.primary),
                  const SizedBox(width: AppSpacing.sm),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.title, style: theme.textTheme.titleSmall),
                        if (widget.subtitle != null)
                          Text(
                            widget.subtitle!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (widget.trailing != null) widget.trailing!,
                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 180),
                    child: const Icon(Icons.keyboard_arrow_down_rounded),
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: const SizedBox(width: double.infinity),
            secondChild: Padding(
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.md,
                0,
                AppSpacing.md,
                AppSpacing.md,
              ),
              child: widget.child,
            ),
            crossFadeState: _expanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 180),
            sizeCurve: Curves.easeInOut,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// The explicit drag handle used for every reorderable list in the app
/// (top-level sections, and entries within a section) — dragging is only
/// ever initiated from this handle, never from tapping anywhere on a card,
/// so it never conflicts with tapping into a text field.
class SectionReorderHandle extends StatelessWidget {
  const SectionReorderHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.drag_indicator_rounded,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );
  }
}

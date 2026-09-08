import 'package:flutter/material.dart';

import '../../../core/design/app_spacing.dart';
import '../../../core/design/widgets/app_card.dart';
import '../../../core/design/widgets/confirmation_dialog.dart';
import '../../../core/design/widgets/empty_state.dart';
import '../../../core/design/widgets/section_reorder_handle.dart';
import '../schemas/field_schema.dart';
import 'item_form_bottom_sheet.dart';

/// The generic, schema-driven editor every list-type resume section
/// (experience, education, projects, certifications, languages, awards,
/// achievements, publications, volunteer experience, references, custom
/// section items) is built from. One schema file + this widget replaces
/// what would otherwise be a bespoke screen per section.
class RepeatableListSectionEditor extends StatelessWidget {
  const RepeatableListSectionEditor({
    super.key,
    required this.schema,
    required this.items,
    required this.onChanged,
  });

  final RepeatableSectionSchema schema;
  final List<Map<String, dynamic>> items;
  final ValueChanged<List<Map<String, dynamic>>> onChanged;

  Future<void> _add(BuildContext context) async {
    final result = await showItemFormSheet(
      context: context,
      schema: schema,
      initialItem: schema.emptyItemBuilder(),
      isNew: true,
    );
    if (result != null) onChanged([...items, result]);
  }

  Future<void> _edit(BuildContext context, int index) async {
    final result = await showItemFormSheet(
      context: context,
      schema: schema,
      initialItem: items[index],
      isNew: false,
    );
    if (result != null) {
      final next = List<Map<String, dynamic>>.from(items);
      next[index] = result;
      onChanged(next);
    }
  }

  void _duplicate(int index) {
    final copy = Map<String, dynamic>.from(items[index]);
    final next = List<Map<String, dynamic>>.from(items)..insert(index + 1, copy);
    onChanged(next);
  }

  Future<void> _delete(BuildContext context, int index) async {
    final confirmed = await showConfirmationDialog(
      context: context,
      title: 'Remove this entry?',
      message: 'This will remove it from your resume.',
      confirmLabel: 'Remove',
    );
    if (!confirmed) return;
    final next = List<Map<String, dynamic>>.from(items)..removeAt(index);
    onChanged(next);
  }

  void _reorder(int oldIndex, int newIndex) {
    final next = List<Map<String, dynamic>>.from(items);
    final item = next.removeAt(oldIndex);
    next.insert(newIndex, item);
    onChanged(next);
  }

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return EmptyState(
        icon: Icons.playlist_add_rounded,
        title: schema.emptyStateTitle,
        message: schema.emptyStateBody,
        actionLabel: schema.addButtonLabel,
        onAction: () => _add(context),
        compact: true,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ReorderableListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          buildDefaultDragHandles: false,
          itemCount: items.length,
          onReorderItem: _reorder,
          itemBuilder: (context, index) {
            final item = items[index];
            return Padding(
              key: ValueKey(item['id'] ?? index),
              padding: const EdgeInsets.only(bottom: AppSpacing.xs),
              child: AppCard(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                onTap: () => _edit(context, index),
                child: Row(
                  children: [
                    ReorderableDragStartListener(
                      index: index,
                      child: const Padding(
                        padding: EdgeInsets.only(right: AppSpacing.xs),
                        child: SectionReorderHandle(),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            schema.titleBuilder(item),
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          if (schema.subtitleBuilder(item)?.isNotEmpty ?? false)
                            Text(
                              schema.subtitleBuilder(item)!,
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                            ),
                        ],
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (action) {
                        switch (action) {
                          case 'duplicate':
                            _duplicate(index);
                            break;
                          case 'delete':
                            _delete(context, index);
                            break;
                        }
                      },
                      itemBuilder: (context) => const [
                        PopupMenuItem(value: 'duplicate', child: Text('Duplicate')),
                        PopupMenuItem(value: 'delete', child: Text('Delete')),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        const SizedBox(height: AppSpacing.xs),
        OutlinedButton.icon(
          onPressed: () => _add(context),
          icon: const Icon(Icons.add_rounded, size: 18),
          label: Text(schema.addButtonLabel),
        ),
      ],
    );
  }
}

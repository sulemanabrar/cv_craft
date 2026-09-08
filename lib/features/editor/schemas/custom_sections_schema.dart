import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/id_generator.dart';
import '../../../data/models/custom_section.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(CustomSectionItem i) => {
      'id': i.id,
      'title': i.title,
      'description': i.description,
    };

CustomSectionItem _fromForm(Map<String, dynamic> m) => CustomSectionItem(
      id: m['id'] as String,
      title: (m['title'] as String?) ?? '',
      description: (m['description'] as String?) ?? '',
    );

RepeatableSectionSchema _schemaFor(String sectionTitle) => RepeatableSectionSchema(
      sectionTitle: sectionTitle,
      fields: [
        const FieldSchema(key: 'title', label: 'Title', type: FieldInputType.text),
        const FieldSchema(key: 'description', label: 'Description', type: FieldInputType.multiline),
      ],
      titleBuilder: (item) =>
          (item['title'] as String?)?.isNotEmpty == true ? item['title'] as String : 'Untitled entry',
      subtitleBuilder: (item) => item['description'] as String?,
      emptyItemBuilder: () => {'id': generateId()},
      emptyStateTitle: 'Nothing added yet',
      emptyStateBody: 'Add entries for this custom section.',
      addButtonLabel: 'Add Entry',
    );

/// Editor for one custom section's items. Custom sections are dynamic
/// (user-created, arbitrary count) so — unlike the fixed section schemas —
/// this needs the section's id to know which `CustomSection` to update.
class CustomSectionItemsEditor extends ConsumerWidget {
  const CustomSectionItemsEditor({super.key, required this.resumeId, required this.sectionId});

  final String resumeId;
  final String sectionId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final section = ref.watch(
      resumeEditorProvider(resumeId).select(
        (r) => r.customSections.where((s) => s.id == sectionId).firstOrNull,
      ),
    );
    if (section == null) return const SizedBox();
    return RepeatableListSectionEditor(
      schema: _schemaFor(section.title),
      items: section.items.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateCustomSectionItems(
              sectionId,
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

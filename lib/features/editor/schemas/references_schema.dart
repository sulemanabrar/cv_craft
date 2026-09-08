import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/id_generator.dart';
import '../../../data/models/reference_entry.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(ReferenceEntry r) => {
      'id': r.id,
      'name': r.name,
      'relationship': r.relationship,
      'company': r.company,
      'email': r.email,
      'phone': r.phone,
    };

ReferenceEntry _fromForm(Map<String, dynamic> m) => ReferenceEntry(
      id: m['id'] as String,
      name: (m['name'] as String?) ?? '',
      relationship: (m['relationship'] as String?) ?? '',
      company: (m['company'] as String?) ?? '',
      email: (m['email'] as String?) ?? '',
      phone: (m['phone'] as String?) ?? '',
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'References',
  fields: [
    const FieldSchema(key: 'name', label: 'Name', type: FieldInputType.text),
    const FieldSchema(key: 'relationship', label: 'Relationship / Title', type: FieldInputType.text),
    const FieldSchema(key: 'company', label: 'Company', type: FieldInputType.text),
    const FieldSchema(key: 'email', label: 'Email', type: FieldInputType.text),
    const FieldSchema(key: 'phone', label: 'Phone', type: FieldInputType.text),
  ],
  titleBuilder: (item) =>
      (item['name'] as String?)?.isNotEmpty == true ? item['name'] as String : 'Untitled reference',
  subtitleBuilder: (item) => item['relationship'] as String?,
  emptyItemBuilder: () => {'id': generateId()},
  emptyStateTitle: 'No references added yet',
  emptyStateBody: 'Add people who can vouch for your work.',
  addButtonLabel: 'Add Reference',
);

class ReferencesSectionEditor extends ConsumerWidget {
  const ReferencesSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final references = ref.watch(
      resumeEditorProvider(resumeId).select((r) => r.references),
    );
    return RepeatableListSectionEditor(
      schema: _schema,
      items: references.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateReferences(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

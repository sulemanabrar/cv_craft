import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/id_generator.dart';
import '../../../data/models/interest.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(Interest i) => {'id': i.id, 'name': i.name};

Interest _fromForm(Map<String, dynamic> m) => Interest(
      id: m['id'] as String,
      name: (m['name'] as String?) ?? '',
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'Interests',
  fields: [
    const FieldSchema(key: 'name', label: 'Interest', type: FieldInputType.text),
  ],
  titleBuilder: (item) =>
      (item['name'] as String?)?.isNotEmpty == true ? item['name'] as String : 'Untitled interest',
  subtitleBuilder: (_) => null,
  emptyItemBuilder: () => {'id': generateId()},
  emptyStateTitle: 'No interests added yet',
  emptyStateBody: 'A few personal interests can add a human touch.',
  addButtonLabel: 'Add Interest',
);

class InterestsSectionEditor extends ConsumerWidget {
  const InterestsSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final interests = ref.watch(
      resumeEditorProvider(resumeId).select((r) => r.interests),
    );
    return RepeatableListSectionEditor(
      schema: _schema,
      items: interests.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateInterests(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

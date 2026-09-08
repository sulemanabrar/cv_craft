import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/date_format_utils.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/award.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(Award a) => {
      'id': a.id,
      'title': a.title,
      'issuer': a.issuer,
      'date': a.date,
      'description': a.description,
    };

Award _fromForm(Map<String, dynamic> m) => Award(
      id: m['id'] as String,
      title: (m['title'] as String?) ?? '',
      issuer: (m['issuer'] as String?) ?? '',
      date: m['date'] as DateTime?,
      description: (m['description'] as String?) ?? '',
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'Awards',
  fields: [
    const FieldSchema(key: 'title', label: 'Award Title', type: FieldInputType.text),
    const FieldSchema(key: 'issuer', label: 'Issuer', type: FieldInputType.text),
    const FieldSchema(key: 'date', label: 'Date', type: FieldInputType.date),
    const FieldSchema(key: 'description', label: 'Description', type: FieldInputType.multiline),
  ],
  titleBuilder: (item) =>
      (item['title'] as String?)?.isNotEmpty == true ? item['title'] as String : 'Untitled award',
  subtitleBuilder: (item) {
    final parts = [
      (item['issuer'] as String?) ?? '',
      if (item['date'] != null) DateFormatUtils.monthYear(item['date'] as DateTime),
    ].where((s) => s.isNotEmpty);
    return parts.join(' · ');
  },
  emptyItemBuilder: () => {'id': generateId()},
  emptyStateTitle: 'No awards added yet',
  emptyStateBody: 'Recognition builds trust with employers.',
  addButtonLabel: 'Add Award',
);

class AwardsSectionEditor extends ConsumerWidget {
  const AwardsSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final awards = ref.watch(resumeEditorProvider(resumeId).select((r) => r.awards));
    return RepeatableListSectionEditor(
      schema: _schema,
      items: awards.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateAwards(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

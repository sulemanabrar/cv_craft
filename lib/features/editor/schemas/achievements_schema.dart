import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/date_format_utils.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/achievement.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(Achievement a) => {
      'id': a.id,
      'title': a.title,
      'description': a.description,
      'date': a.date,
    };

Achievement _fromForm(Map<String, dynamic> m) => Achievement(
      id: m['id'] as String,
      title: (m['title'] as String?) ?? '',
      description: (m['description'] as String?) ?? '',
      date: m['date'] as DateTime?,
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'Achievements',
  fields: [
    const FieldSchema(key: 'title', label: 'Achievement', type: FieldInputType.text),
    const FieldSchema(key: 'description', label: 'Description', type: FieldInputType.multiline),
    const FieldSchema(key: 'date', label: 'Date', type: FieldInputType.date),
  ],
  titleBuilder: (item) =>
      (item['title'] as String?)?.isNotEmpty == true ? item['title'] as String : 'Untitled achievement',
  subtitleBuilder: (item) =>
      item['date'] != null ? DateFormatUtils.monthYear(item['date'] as DateTime) : null,
  emptyItemBuilder: () => {'id': generateId()},
  emptyStateTitle: 'No achievements added yet',
  emptyStateBody: 'Highlight standout wins beyond your job duties.',
  addButtonLabel: 'Add Achievement',
);

class AchievementsSectionEditor extends ConsumerWidget {
  const AchievementsSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final achievements = ref.watch(
      resumeEditorProvider(resumeId).select((r) => r.achievements),
    );
    return RepeatableListSectionEditor(
      schema: _schema,
      items: achievements.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateAchievements(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/date_format_utils.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/education.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(Education e) => {
      'id': e.id,
      'degree': e.degree,
      'institution': e.institution,
      'location': e.location,
      'startDate': e.startDate,
      'endDate': e.endDate,
      'isCurrent': e.isCurrent,
      'gradeOrGpa': e.gradeOrGpa,
      'description': e.description,
    };

Education _fromForm(Map<String, dynamic> m) => Education(
      id: m['id'] as String,
      degree: (m['degree'] as String?) ?? '',
      institution: (m['institution'] as String?) ?? '',
      location: (m['location'] as String?) ?? '',
      startDate: m['startDate'] as DateTime?,
      endDate: m['endDate'] as DateTime?,
      isCurrent: (m['isCurrent'] as bool?) ?? false,
      gradeOrGpa: (m['gradeOrGpa'] as String?) ?? '',
      description: (m['description'] as String?) ?? '',
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'Education',
  fields: [
    const FieldSchema(key: 'degree', label: 'Degree', type: FieldInputType.text),
    const FieldSchema(key: 'institution', label: 'Institution', type: FieldInputType.text),
    const FieldSchema(key: 'location', label: 'Location', type: FieldInputType.text),
    const FieldSchema(key: 'startDate', label: 'Start Date', type: FieldInputType.date),
    FieldSchema(
      key: 'endDate',
      label: 'End Date',
      type: FieldInputType.date,
      visibleWhen: (item) => item['isCurrent'] != true,
    ),
    const FieldSchema(key: 'isCurrent', label: 'Currently studying here', type: FieldInputType.toggle),
    const FieldSchema(key: 'gradeOrGpa', label: 'Grade / GPA', type: FieldInputType.text),
    const FieldSchema(key: 'description', label: 'Description', type: FieldInputType.multiline),
  ],
  titleBuilder: (item) =>
      (item['degree'] as String?)?.isNotEmpty == true ? item['degree'] as String : 'Untitled degree',
  subtitleBuilder: (item) {
    final parts = [
      (item['institution'] as String?) ?? '',
      DateFormatUtils.dateRange(
        start: item['startDate'] as DateTime?,
        end: item['endDate'] as DateTime?,
        isCurrent: item['isCurrent'] == true,
      ),
    ].where((s) => s.isNotEmpty);
    return parts.join(' · ');
  },
  emptyItemBuilder: () => {'id': generateId(), 'isCurrent': false},
  emptyStateTitle: 'No education added yet',
  emptyStateBody: 'Add your degrees or certifications to build credibility.',
  addButtonLabel: 'Add Education',
);

class EducationSectionEditor extends ConsumerWidget {
  const EducationSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final education = ref.watch(
      resumeEditorProvider(resumeId).select((r) => r.education),
    );
    return RepeatableListSectionEditor(
      schema: _schema,
      items: education.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateEducation(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

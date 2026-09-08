import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/date_format_utils.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/experience.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(Experience e) => {
      'id': e.id,
      'jobTitle': e.jobTitle,
      'company': e.company,
      'location': e.location,
      'startDate': e.startDate,
      'endDate': e.endDate,
      'isCurrent': e.isCurrent,
      'description': e.description,
    };

Experience _fromForm(Map<String, dynamic> m) => Experience(
      id: m['id'] as String,
      jobTitle: (m['jobTitle'] as String?) ?? '',
      company: (m['company'] as String?) ?? '',
      location: (m['location'] as String?) ?? '',
      startDate: m['startDate'] as DateTime?,
      endDate: m['endDate'] as DateTime?,
      isCurrent: (m['isCurrent'] as bool?) ?? false,
      description: (m['description'] as String?) ?? '',
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'Work Experience',
  fields: [
    const FieldSchema(key: 'jobTitle', label: 'Job Title', type: FieldInputType.text),
    const FieldSchema(key: 'company', label: 'Company', type: FieldInputType.text),
    const FieldSchema(key: 'location', label: 'Location', type: FieldInputType.text),
    const FieldSchema(key: 'startDate', label: 'Start Date', type: FieldInputType.date),
    FieldSchema(
      key: 'endDate',
      label: 'End Date',
      type: FieldInputType.date,
      visibleWhen: (item) => item['isCurrent'] != true,
    ),
    const FieldSchema(key: 'isCurrent', label: 'Currently working here', type: FieldInputType.toggle),
    const FieldSchema(
      key: 'description',
      label: 'Description',
      type: FieldInputType.multiline,
      placeholder: 'One achievement per line works best.',
    ),
  ],
  titleBuilder: (item) => (item['jobTitle'] as String?)?.isNotEmpty == true
      ? item['jobTitle'] as String
      : 'Untitled role',
  subtitleBuilder: (item) {
    final parts = [
      (item['company'] as String?) ?? '',
      DateFormatUtils.dateRange(
        start: item['startDate'] as DateTime?,
        end: item['endDate'] as DateTime?,
        isCurrent: item['isCurrent'] == true,
      ),
    ].where((s) => s.isNotEmpty);
    return parts.join(' · ');
  },
  emptyItemBuilder: () => {'id': generateId(), 'isCurrent': false},
  emptyStateTitle: 'No experience added yet',
  emptyStateBody: "Show employers where you've made an impact.",
  addButtonLabel: 'Add Experience',
);

class ExperienceSectionEditor extends ConsumerWidget {
  const ExperienceSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences = ref.watch(
      resumeEditorProvider(resumeId).select((r) => r.experiences),
    );
    return RepeatableListSectionEditor(
      schema: _schema,
      items: experiences.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateExperiences(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

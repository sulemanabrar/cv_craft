import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/date_format_utils.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/volunteer_experience.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(VolunteerExperience v) => {
      'id': v.id,
      'role': v.role,
      'organization': v.organization,
      'location': v.location,
      'startDate': v.startDate,
      'endDate': v.endDate,
      'isCurrent': v.isCurrent,
      'description': v.description,
    };

VolunteerExperience _fromForm(Map<String, dynamic> m) => VolunteerExperience(
      id: m['id'] as String,
      role: (m['role'] as String?) ?? '',
      organization: (m['organization'] as String?) ?? '',
      location: (m['location'] as String?) ?? '',
      startDate: m['startDate'] as DateTime?,
      endDate: m['endDate'] as DateTime?,
      isCurrent: (m['isCurrent'] as bool?) ?? false,
      description: (m['description'] as String?) ?? '',
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'Volunteer Experience',
  fields: [
    const FieldSchema(key: 'role', label: 'Role', type: FieldInputType.text),
    const FieldSchema(key: 'organization', label: 'Organization', type: FieldInputType.text),
    const FieldSchema(key: 'location', label: 'Location', type: FieldInputType.text),
    const FieldSchema(key: 'startDate', label: 'Start Date', type: FieldInputType.date),
    FieldSchema(
      key: 'endDate',
      label: 'End Date',
      type: FieldInputType.date,
      visibleWhen: (item) => item['isCurrent'] != true,
    ),
    const FieldSchema(key: 'isCurrent', label: 'Currently volunteering here', type: FieldInputType.toggle),
    const FieldSchema(key: 'description', label: 'Description', type: FieldInputType.multiline),
  ],
  titleBuilder: (item) =>
      (item['role'] as String?)?.isNotEmpty == true ? item['role'] as String : 'Untitled role',
  subtitleBuilder: (item) {
    final parts = [
      (item['organization'] as String?) ?? '',
      DateFormatUtils.dateRange(
        start: item['startDate'] as DateTime?,
        end: item['endDate'] as DateTime?,
        isCurrent: item['isCurrent'] == true,
      ),
    ].where((s) => s.isNotEmpty);
    return parts.join(' · ');
  },
  emptyItemBuilder: () => {'id': generateId(), 'isCurrent': false},
  emptyStateTitle: 'No volunteer experience added yet',
  emptyStateBody: 'Community involvement can set you apart.',
  addButtonLabel: 'Add Volunteer Experience',
);

class VolunteerSectionEditor extends ConsumerWidget {
  const VolunteerSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteer = ref.watch(
      resumeEditorProvider(resumeId).select((r) => r.volunteerExperience),
    );
    return RepeatableListSectionEditor(
      schema: _schema,
      items: volunteer.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateVolunteerExperience(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

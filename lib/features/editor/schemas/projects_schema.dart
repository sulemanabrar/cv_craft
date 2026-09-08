import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/id_generator.dart';
import '../../../data/models/project.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(Project p) => {
      'id': p.id,
      'name': p.name,
      'role': p.role,
      'description': p.description,
      'technologies': p.technologies.join(', '),
      'url': p.url,
      'githubUrl': p.githubUrl,
    };

Project _fromForm(Map<String, dynamic> m) => Project(
      id: m['id'] as String,
      name: (m['name'] as String?) ?? '',
      role: (m['role'] as String?) ?? '',
      description: (m['description'] as String?) ?? '',
      technologies: ((m['technologies'] as String?) ?? '')
          .split(',')
          .map((s) => s.trim())
          .where((s) => s.isNotEmpty)
          .toList(),
      url: (m['url'] as String?) ?? '',
      githubUrl: (m['githubUrl'] as String?) ?? '',
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'Projects',
  fields: [
    const FieldSchema(key: 'name', label: 'Project Name', type: FieldInputType.text),
    const FieldSchema(key: 'role', label: 'Role', type: FieldInputType.text),
    const FieldSchema(key: 'description', label: 'Description', type: FieldInputType.multiline),
    const FieldSchema(
      key: 'technologies',
      label: 'Technologies',
      type: FieldInputType.text,
      placeholder: 'Comma-separated, e.g. Flutter, Firebase',
    ),
    const FieldSchema(key: 'url', label: 'Project URL', type: FieldInputType.text),
    const FieldSchema(key: 'githubUrl', label: 'GitHub URL', type: FieldInputType.text),
  ],
  titleBuilder: (item) =>
      (item['name'] as String?)?.isNotEmpty == true ? item['name'] as String : 'Untitled project',
  subtitleBuilder: (item) => item['role'] as String?,
  emptyItemBuilder: () => {'id': generateId()},
  emptyStateTitle: 'No projects added yet',
  emptyStateBody: 'Showcase the work you\'re proud of.',
  addButtonLabel: 'Add Project',
);

class ProjectsSectionEditor extends ConsumerWidget {
  const ProjectsSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projects = ref.watch(
      resumeEditorProvider(resumeId).select((r) => r.projects),
    );
    return RepeatableListSectionEditor(
      schema: _schema,
      items: projects.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateProjects(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/id_generator.dart';
import '../../../data/models/publication.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(Publication p) => {
      'id': p.id,
      'title': p.title,
      'publisher': p.publisher,
      'date': p.date,
      'url': p.url,
      'description': p.description,
    };

Publication _fromForm(Map<String, dynamic> m) => Publication(
      id: m['id'] as String,
      title: (m['title'] as String?) ?? '',
      publisher: (m['publisher'] as String?) ?? '',
      date: m['date'] as DateTime?,
      url: (m['url'] as String?) ?? '',
      description: (m['description'] as String?) ?? '',
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'Publications',
  fields: [
    const FieldSchema(key: 'title', label: 'Title', type: FieldInputType.text),
    const FieldSchema(key: 'publisher', label: 'Publisher', type: FieldInputType.text),
    const FieldSchema(key: 'date', label: 'Date', type: FieldInputType.date),
    const FieldSchema(key: 'url', label: 'URL', type: FieldInputType.text),
    const FieldSchema(key: 'description', label: 'Description', type: FieldInputType.multiline),
  ],
  titleBuilder: (item) =>
      (item['title'] as String?)?.isNotEmpty == true ? item['title'] as String : 'Untitled publication',
  subtitleBuilder: (item) => item['publisher'] as String?,
  emptyItemBuilder: () => {'id': generateId()},
  emptyStateTitle: 'No publications added yet',
  emptyStateBody: 'Add papers, articles, or posts you\'ve published.',
  addButtonLabel: 'Add Publication',
);

class PublicationsSectionEditor extends ConsumerWidget {
  const PublicationsSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final publications = ref.watch(
      resumeEditorProvider(resumeId).select((r) => r.publications),
    );
    return RepeatableListSectionEditor(
      schema: _schema,
      items: publications.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updatePublications(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

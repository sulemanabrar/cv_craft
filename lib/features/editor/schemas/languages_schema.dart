import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/id_generator.dart';
import '../../../data/models/language_entry.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

const proficiencyOptions = ['Native', 'Fluent', 'Advanced', 'Conversational', 'Basic'];

Map<String, dynamic> _toForm(LanguageEntry l) => {
      'id': l.id,
      'name': l.name,
      'proficiency': l.proficiency,
    };

LanguageEntry _fromForm(Map<String, dynamic> m) => LanguageEntry(
      id: m['id'] as String,
      name: (m['name'] as String?) ?? '',
      proficiency: (m['proficiency'] as String?) ?? 'Conversational',
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'Languages',
  fields: [
    const FieldSchema(key: 'name', label: 'Language', type: FieldInputType.text),
    const FieldSchema(
      key: 'proficiency',
      label: 'Proficiency',
      type: FieldInputType.dropdown,
      dropdownOptions: proficiencyOptions,
    ),
  ],
  titleBuilder: (item) =>
      (item['name'] as String?)?.isNotEmpty == true ? item['name'] as String : 'Untitled language',
  subtitleBuilder: (item) => item['proficiency'] as String?,
  emptyItemBuilder: () => {'id': generateId(), 'proficiency': 'Conversational'},
  emptyStateTitle: 'No languages added yet',
  emptyStateBody: 'List the languages you speak and your proficiency.',
  addButtonLabel: 'Add Language',
);

class LanguagesSectionEditor extends ConsumerWidget {
  const LanguagesSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(
      resumeEditorProvider(resumeId).select((r) => r.languages),
    );
    return RepeatableListSectionEditor(
      schema: _schema,
      items: languages.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateLanguages(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/utils/date_format_utils.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/certification.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';
import '../widgets/repeatable_list_section_editor.dart';
import 'field_schema.dart';

Map<String, dynamic> _toForm(Certification c) => {
      'id': c.id,
      'name': c.name,
      'issuer': c.issuer,
      'issueDate': c.issueDate,
      'expiryDate': c.expiryDate,
      'credentialId': c.credentialId,
      'credentialUrl': c.credentialUrl,
    };

Certification _fromForm(Map<String, dynamic> m) => Certification(
      id: m['id'] as String,
      name: (m['name'] as String?) ?? '',
      issuer: (m['issuer'] as String?) ?? '',
      issueDate: m['issueDate'] as DateTime?,
      expiryDate: m['expiryDate'] as DateTime?,
      credentialId: (m['credentialId'] as String?) ?? '',
      credentialUrl: (m['credentialUrl'] as String?) ?? '',
    );

final _schema = RepeatableSectionSchema(
  sectionTitle: 'Certifications',
  fields: [
    const FieldSchema(key: 'name', label: 'Certification Name', type: FieldInputType.text),
    const FieldSchema(key: 'issuer', label: 'Issuing Organization', type: FieldInputType.text),
    const FieldSchema(key: 'issueDate', label: 'Issue Date', type: FieldInputType.date),
    const FieldSchema(key: 'expiryDate', label: 'Expiry Date', type: FieldInputType.date),
    const FieldSchema(key: 'credentialId', label: 'Credential ID', type: FieldInputType.text),
    const FieldSchema(key: 'credentialUrl', label: 'Credential URL', type: FieldInputType.text),
  ],
  titleBuilder: (item) =>
      (item['name'] as String?)?.isNotEmpty == true ? item['name'] as String : 'Untitled certification',
  subtitleBuilder: (item) {
    final parts = [
      (item['issuer'] as String?) ?? '',
      if (item['issueDate'] != null) DateFormatUtils.monthYear(item['issueDate'] as DateTime),
    ].where((s) => s.isNotEmpty);
    return parts.join(' · ');
  },
  emptyItemBuilder: () => {'id': generateId()},
  emptyStateTitle: 'No certifications added yet',
  emptyStateBody: 'Add certifications that strengthen your credibility.',
  addButtonLabel: 'Add Certification',
);

class CertificationsSectionEditor extends ConsumerWidget {
  const CertificationsSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final certifications = ref.watch(
      resumeEditorProvider(resumeId).select((r) => r.certifications),
    );
    return RepeatableListSectionEditor(
      schema: _schema,
      items: certifications.map(_toForm).toList(),
      onChanged: (items) {
        ref.read(resumeEditorProvider(resumeId).notifier).updateCertifications(
              (_) => items.map(_fromForm).toList(),
            );
      },
    );
  }
}

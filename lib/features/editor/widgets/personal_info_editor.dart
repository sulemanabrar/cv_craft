import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/app_spacing.dart';
import '../../../core/design/widgets/app_text_field.dart';
import '../../../data/models/personal_info.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';

class PersonalInfoEditor extends ConsumerStatefulWidget {
  const PersonalInfoEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  ConsumerState<PersonalInfoEditor> createState() => _PersonalInfoEditorState();
}

class _PersonalInfoEditorState extends ConsumerState<PersonalInfoEditor> {
  late final Map<String, TextEditingController> _controllers;

  PersonalInfo get _info =>
      ref.read(resumeEditorProvider(widget.resumeId)).personalInfo;

  @override
  void initState() {
    super.initState();
    final info = _info;
    _controllers = {
      'fullName': TextEditingController(text: info.fullName),
      'professionalTitle': TextEditingController(text: info.professionalTitle),
      'email': TextEditingController(text: info.email),
      'phone': TextEditingController(text: info.phone),
      'location': TextEditingController(text: info.location),
      'linkedIn': TextEditingController(text: info.linkedIn),
      'portfolio': TextEditingController(text: info.portfolio),
      'github': TextEditingController(text: info.github),
      'website': TextEditingController(text: info.website),
    };
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    super.dispose();
  }

  void _update(PersonalInfo Function(PersonalInfo) updater) {
    ref.read(resumeEditorProvider(widget.resumeId).notifier).updatePersonalInfo(updater);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: _controllers['fullName'],
          label: 'Full Name',
          onChanged: (v) => _update((i) => i.copyWith(fullName: v)),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppTextField(
          controller: _controllers['professionalTitle'],
          label: 'Professional Title',
          hintText: 'e.g. Senior Flutter Developer',
          onChanged: (v) => _update((i) => i.copyWith(professionalTitle: v)),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppTextField(
          controller: _controllers['email'],
          label: 'Email',
          keyboardType: TextInputType.emailAddress,
          onChanged: (v) => _update((i) => i.copyWith(email: v)),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppTextField(
          controller: _controllers['phone'],
          label: 'Phone',
          keyboardType: TextInputType.phone,
          onChanged: (v) => _update((i) => i.copyWith(phone: v)),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppTextField(
          controller: _controllers['location'],
          label: 'Location',
          hintText: 'City, State',
          onChanged: (v) => _update((i) => i.copyWith(location: v)),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppTextField(
          controller: _controllers['linkedIn'],
          label: 'LinkedIn',
          onChanged: (v) => _update((i) => i.copyWith(linkedIn: v)),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppTextField(
          controller: _controllers['portfolio'],
          label: 'Portfolio',
          onChanged: (v) => _update((i) => i.copyWith(portfolio: v)),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppTextField(
          controller: _controllers['github'],
          label: 'GitHub',
          onChanged: (v) => _update((i) => i.copyWith(github: v)),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppTextField(
          controller: _controllers['website'],
          label: 'Website',
          onChanged: (v) => _update((i) => i.copyWith(website: v)),
        ),
      ],
    );
  }
}

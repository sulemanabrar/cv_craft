import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/app_spacing.dart';
import '../../../core/design/widgets/app_bottom_sheet.dart';
import '../../../core/design/widgets/app_dropdown.dart';
import '../../../core/design/widgets/app_text_field.dart';
import '../../../core/design/widgets/empty_state.dart';
import '../../../core/design/widgets/primary_button.dart';
import '../../../core/utils/id_generator.dart';
import '../../../data/models/skill.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';

const _groupPresets = ['Technical Skills', 'Soft Skills', 'Tools', 'Frameworks'];
const _levelLabels = {
  null: 'No level',
  SkillLevel.beginner: 'Beginner',
  SkillLevel.intermediate: 'Intermediate',
  SkillLevel.advanced: 'Advanced',
  SkillLevel.expert: 'Expert',
};

class SkillsSectionEditor extends ConsumerWidget {
  const SkillsSectionEditor({super.key, required this.resumeId});

  final String resumeId;

  Future<void> _addSkill(BuildContext context, WidgetRef ref) async {
    final skill = await showAppBottomSheet<Skill>(
      context: context,
      title: 'Add Skill',
      builder: (context) => const _SkillForm(),
    );
    if (skill != null) {
      ref.read(resumeEditorProvider(resumeId).notifier).updateSkills((skills) => [...skills, skill]);
    }
  }

  void _remove(WidgetRef ref, String id) {
    ref.read(resumeEditorProvider(resumeId).notifier).updateSkills(
          (skills) => skills.where((s) => s.id != id).toList(),
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final skills = ref.watch(resumeEditorProvider(resumeId).select((r) => r.skills));
    final theme = Theme.of(context);

    if (skills.isEmpty) {
      return Column(
        children: [
          EmptyState(
            icon: Icons.psychology_alt_outlined,
            title: 'No skills added yet',
            message: 'Add the skills most relevant to the role you want.',
            compact: true,
          ),
          const SizedBox(height: AppSpacing.xs),
          OutlinedButton.icon(
            onPressed: () => _addSkill(context, ref),
            icon: const Icon(Icons.add_rounded, size: 18),
            label: const Text('Add Skill'),
          ),
        ],
      );
    }

    final grouped = <String, List<Skill>>{};
    for (final skill in skills) {
      grouped.putIfAbsent(skill.group, () => []).add(skill);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final entry in grouped.entries) ...[
          Text(entry.key, style: theme.textTheme.labelLarge),
          const SizedBox(height: AppSpacing.xxs),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final skill in entry.value)
                Chip(
                  label: Text(
                    skill.level != null ? '${skill.name} · ${_levelLabels[skill.level]}' : skill.name,
                  ),
                  onDeleted: () => _remove(ref, skill.id),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
        ],
        OutlinedButton.icon(
          onPressed: () => _addSkill(context, ref),
          icon: const Icon(Icons.add_rounded, size: 18),
          label: const Text('Add Skill'),
        ),
      ],
    );
  }
}

class _SkillForm extends StatefulWidget {
  const _SkillForm();

  @override
  State<_SkillForm> createState() => _SkillFormState();
}

class _SkillFormState extends State<_SkillForm> {
  final _nameController = TextEditingController();
  String _group = _groupPresets.first;
  SkillLevel? _level;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(controller: _nameController, label: 'Skill', autofocus: true),
        const SizedBox(height: AppSpacing.sm),
        AppDropdown<String>(
          label: 'Group',
          value: _group,
          items: _groupPresets,
          itemLabel: (v) => v,
          onChanged: (v) => setState(() => _group = v),
        ),
        const SizedBox(height: AppSpacing.sm),
        AppDropdown<SkillLevel?>(
          label: 'Level (optional)',
          value: _level,
          items: const [null, ...SkillLevel.values],
          itemLabel: (v) => _levelLabels[v]!,
          onChanged: (v) => setState(() => _level = v),
        ),
        const SizedBox(height: AppSpacing.md),
        PrimaryButton(
          label: 'Add',
          expand: true,
          onPressed: () {
            final name = _nameController.text.trim();
            if (name.isEmpty) return;
            Navigator.of(context).pop(
              Skill(id: generateId(), name: name, group: _group, level: _level),
            );
          },
        ),
      ],
    );
  }
}

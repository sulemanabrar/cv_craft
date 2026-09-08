import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/route_paths.dart';
import '../../core/constants/section_types.dart';
import '../../core/design/app_spacing.dart';
import '../../core/design/widgets/app_dialog.dart';
import '../../core/design/widgets/expandable_section_card.dart';
import '../../core/design/widgets/saving_indicator.dart';
import '../../core/design/widgets/section_reorder_handle.dart';
import '../../state/resume_editor/autosave_provider.dart';
import '../../state/resume_editor/resume_editor_provider.dart';
import '../../templates/shared/resume_section_content.dart';
import 'schemas/achievements_schema.dart';
import 'schemas/awards_schema.dart';
import 'schemas/certifications_schema.dart';
import 'schemas/custom_sections_schema.dart';
import 'schemas/education_schema.dart';
import 'schemas/experience_schema.dart';
import 'schemas/interests_schema.dart';
import 'schemas/languages_schema.dart';
import 'schemas/projects_schema.dart';
import 'schemas/publications_schema.dart';
import 'schemas/references_schema.dart';
import 'schemas/volunteer_schema.dart';
import 'section_visibility_sheet.dart';
import 'widgets/cv_completion_badge.dart';
import 'widgets/personal_info_editor.dart';
import 'widgets/skills_section_editor.dart';
import 'widgets/summary_editor.dart';
import 'widgets/template_switch_sheet.dart';

const _sectionIcons = {
  ResumeSectionType.summary: Icons.short_text_rounded,
  ResumeSectionType.experience: Icons.work_outline_rounded,
  ResumeSectionType.education: Icons.school_outlined,
  ResumeSectionType.skills: Icons.psychology_alt_outlined,
  ResumeSectionType.projects: Icons.rocket_launch_outlined,
  ResumeSectionType.certifications: Icons.workspace_premium_outlined,
  ResumeSectionType.languages: Icons.translate_rounded,
  ResumeSectionType.awards: Icons.emoji_events_outlined,
  ResumeSectionType.achievements: Icons.military_tech_outlined,
  ResumeSectionType.publications: Icons.menu_book_outlined,
  ResumeSectionType.volunteerExperience: Icons.volunteer_activism_outlined,
  ResumeSectionType.references: Icons.contact_page_outlined,
  ResumeSectionType.interests: Icons.interests_outlined,
};

class ResumeEditorScreen extends ConsumerWidget {
  const ResumeEditorScreen({super.key, required this.resumeId});

  final String resumeId;

  Widget _contentFor(String key) {
    if (isCustomSectionKey(key)) {
      return CustomSectionItemsEditor(
        resumeId: resumeId,
        sectionId: customSectionIdFromKey(key),
      );
    }
    switch (ResumeSectionType.fromKey(key)) {
      case ResumeSectionType.summary:
        return SummaryEditor(resumeId: resumeId);
      case ResumeSectionType.experience:
        return ExperienceSectionEditor(resumeId: resumeId);
      case ResumeSectionType.education:
        return EducationSectionEditor(resumeId: resumeId);
      case ResumeSectionType.skills:
        return SkillsSectionEditor(resumeId: resumeId);
      case ResumeSectionType.projects:
        return ProjectsSectionEditor(resumeId: resumeId);
      case ResumeSectionType.certifications:
        return CertificationsSectionEditor(resumeId: resumeId);
      case ResumeSectionType.languages:
        return LanguagesSectionEditor(resumeId: resumeId);
      case ResumeSectionType.awards:
        return AwardsSectionEditor(resumeId: resumeId);
      case ResumeSectionType.achievements:
        return AchievementsSectionEditor(resumeId: resumeId);
      case ResumeSectionType.publications:
        return PublicationsSectionEditor(resumeId: resumeId);
      case ResumeSectionType.volunteerExperience:
        return VolunteerSectionEditor(resumeId: resumeId);
      case ResumeSectionType.references:
        return ReferencesSectionEditor(resumeId: resumeId);
      case ResumeSectionType.interests:
        return InterestsSectionEditor(resumeId: resumeId);
      case null:
        return const SizedBox();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resume = ref.watch(resumeEditorProvider(resumeId));
    final savingState = ref.watch(autosaveProvider(resumeId));
    final notifier = ref.read(resumeEditorProvider(resumeId).notifier);

    return PopScope(
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) ref.read(autosaveProvider(resumeId).notifier).saveNow();
      },
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () async {
              final name = await showTextInputDialog(
                context: context,
                title: 'Rename CV',
                initialValue: resume.name,
                confirmLabel: 'Rename',
              );
              if (name != null) notifier.updateName(name);
            },
            child: Text(
              resume.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          actions: [
            SavingIndicator(state: savingState),
            const SizedBox(width: AppSpacing.sm),
            CvCompletionBadge(
              resume: resume,
              onTap: () => showCvStrengthSheet(context, resume),
            ),
            const SizedBox(width: AppSpacing.xs),
            IconButton(
              tooltip: 'Switch Template',
              icon: const Icon(Icons.dashboard_customize_outlined),
              onPressed: () => showTemplateSwitchSheet(context: context, resumeId: resumeId),
            ),
            IconButton(
              tooltip: 'Manage Sections',
              icon: const Icon(Icons.tune_rounded),
              onPressed: () => showSectionVisibilitySheet(context: context, resumeId: resumeId),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.push(RoutePaths.previewPath(resumeId)),
          icon: const Icon(Icons.visibility_outlined),
          label: const Text('Preview'),
        ),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.sm,
              AppSpacing.md,
              AppSpacing.xxxl,
            ),
            children: [
              ExpandableSectionCard(
                icon: Icons.badge_outlined,
                title: 'Personal Information',
                initiallyExpanded: resume.personalInfo.fullName.isEmpty,
                child: PersonalInfoEditor(resumeId: resumeId),
              ),
              const SizedBox(height: AppSpacing.xs),
              ReorderableListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                buildDefaultDragHandles: false,
                itemCount: resume.sectionOrder.length,
                onReorderItem: notifier.reorderSections,
                itemBuilder: (context, index) {
                  final key = resume.sectionOrder[index];
                  final type = ResumeSectionType.fromKey(key);
                  final icon = type != null
                      ? (_sectionIcons[type] ?? Icons.article_outlined)
                      : Icons.article_outlined;
                  return Padding(
                    key: ValueKey(key),
                    padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                    child: ExpandableSectionCard(
                      icon: icon,
                      title: ResumeSectionContent.titleFor(resume, key),
                      trailing: ReorderableDragStartListener(
                        index: index,
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: AppSpacing.xxs),
                          child: SectionReorderHandle(),
                        ),
                      ),
                      child: _contentFor(key),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

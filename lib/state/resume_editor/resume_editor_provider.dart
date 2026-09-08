import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/section_types.dart';
import '../../core/utils/id_generator.dart';
import '../../data/models/models.dart';
import '../resume_list/resume_list_provider.dart';

/// Holds one resume's in-memory editing state. Seeded from whatever
/// [resumeListProvider] already has cached for [resumeId] (falling back to a
/// blank resume only if it's genuinely missing) so opening the editor never
/// re-reads from disk. [AutosaveController] listens to this and persists
/// changes on a debounce; nothing here talks to the repository directly.
class ResumeEditorController extends Notifier<Resume> {
  ResumeEditorController(this.resumeId);

  final String resumeId;

  @override
  Resume build() {
    final resumes = ref.read(resumeListProvider).value ?? const <Resume>[];
    final existing = resumes.firstWhereOrNull((r) => r.id == resumeId);
    return existing ?? createBlankResume(name: 'Untitled CV');
  }

  void _touch(Resume next) {
    state = next.copyWith(updatedAt: DateTime.now());
  }

  // --- Personal info / summary / styling -----------------------------------

  void updateName(String name) {
    _touch(state.copyWith(name: name));
  }

  void updatePersonalInfo(PersonalInfo Function(PersonalInfo) update) {
    _touch(state.copyWith(personalInfo: update(state.personalInfo)));
  }

  void updateSummary(String summary) {
    _touch(state.copyWith(summary: summary));
  }

  void updateStyling(ResumeStyling Function(ResumeStyling) update) {
    _touch(state.copyWith(styling: update(state.styling)));
  }

  void setTemplate(String templateId) {
    _touch(state.copyWith(styling: state.styling.copyWith(templateId: templateId)));
  }

  // --- Section ordering / visibility ---------------------------------------

  /// Expects pre-adjusted indices, i.e. from `ReorderableListView`'s
  /// `onReorderItem` callback (not the deprecated `onReorder`).
  void reorderSections(int oldIndex, int newIndex) {
    final order = List<String>.from(state.sectionOrder);
    final item = order.removeAt(oldIndex);
    order.insert(newIndex, item);
    _touch(state.copyWith(sectionOrder: order));
  }

  void setOptionalSectionEnabled(ResumeSectionType type, bool enabled) {
    final enabledSet = Set<String>.from(state.enabledOptionalSections);
    var order = state.sectionOrder;
    if (enabled) {
      enabledSet.add(type.key);
      order = sectionOrderWithEnabled(order, type.key);
    } else {
      enabledSet.remove(type.key);
      order = sectionOrderWithoutKey(order, type.key);
    }
    _touch(state.copyWith(enabledOptionalSections: enabledSet, sectionOrder: order));
  }

  void addCustomSection(String title) {
    final section = CustomSection(
      id: generateId(),
      title: title.trim().isEmpty ? 'Custom Section' : title.trim(),
    );
    _touch(state.copyWith(
      customSections: [...state.customSections, section],
      sectionOrder: sectionOrderWithEnabled(state.sectionOrder, customSectionKey(section.id)),
    ));
  }

  void renameCustomSection(String id, String title) {
    _touch(state.copyWith(
      customSections: [
        for (final s in state.customSections)
          if (s.id == id) s.copyWith(title: title) else s,
      ],
    ));
  }

  void removeCustomSection(String id) {
    _touch(state.copyWith(
      customSections: state.customSections.where((s) => s.id != id).toList(),
      sectionOrder: sectionOrderWithoutKey(state.sectionOrder, customSectionKey(id)),
    ));
  }

  void updateCustomSectionItems(
    String sectionId,
    List<CustomSectionItem> Function(List<CustomSectionItem>) update,
  ) {
    _touch(state.copyWith(
      customSections: [
        for (final s in state.customSections)
          if (s.id == sectionId) s.copyWith(items: update(s.items)) else s,
      ],
    ));
  }

  // --- Repeatable list sections ---------------------------------------------
  // One updater per list-type section. The generic repeatable-list editor
  // and each section's schema call these; nothing else needs direct
  // `copyWith` access to the resume's list fields.

  void updateExperiences(List<Experience> Function(List<Experience>) update) {
    _touch(state.copyWith(experiences: update(state.experiences)));
  }

  void updateEducation(List<Education> Function(List<Education>) update) {
    _touch(state.copyWith(education: update(state.education)));
  }

  void updateSkills(List<Skill> Function(List<Skill>) update) {
    _touch(state.copyWith(skills: update(state.skills)));
  }

  void updateProjects(List<Project> Function(List<Project>) update) {
    _touch(state.copyWith(projects: update(state.projects)));
  }

  void updateCertifications(List<Certification> Function(List<Certification>) update) {
    _touch(state.copyWith(certifications: update(state.certifications)));
  }

  void updateLanguages(List<LanguageEntry> Function(List<LanguageEntry>) update) {
    _touch(state.copyWith(languages: update(state.languages)));
  }

  void updateAwards(List<Award> Function(List<Award>) update) {
    _touch(state.copyWith(awards: update(state.awards)));
  }

  void updateAchievements(List<Achievement> Function(List<Achievement>) update) {
    _touch(state.copyWith(achievements: update(state.achievements)));
  }

  void updatePublications(List<Publication> Function(List<Publication>) update) {
    _touch(state.copyWith(publications: update(state.publications)));
  }

  void updateVolunteerExperience(
    List<VolunteerExperience> Function(List<VolunteerExperience>) update,
  ) {
    _touch(state.copyWith(volunteerExperience: update(state.volunteerExperience)));
  }

  void updateReferences(List<ReferenceEntry> Function(List<ReferenceEntry>) update) {
    _touch(state.copyWith(references: update(state.references)));
  }

  void updateInterests(List<Interest> Function(List<Interest>) update) {
    _touch(state.copyWith(interests: update(state.interests)));
  }
}

final resumeEditorProvider =
    NotifierProvider.family<ResumeEditorController, Resume, String>(
  ResumeEditorController.new,
);

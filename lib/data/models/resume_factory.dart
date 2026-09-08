import '../../core/constants/section_types.dart';
import '../../core/utils/id_generator.dart';
import '../../templates/template_registry.dart';
import 'resume.dart';

/// Default top-level section order for a newly created resume, per the
/// product spec's example ordering (Summary, Experience, Skills, Projects,
/// Education). Optional sections are appended only once the user enables
/// them.
const List<String> defaultSectionOrder = [
  'summary',
  'experience',
  'skills',
  'projects',
  'education',
];

/// Creates a brand-new, empty [Resume] ready to be edited.
Resume createBlankResume({required String name, String templateId = 'ats_classic'}) {
  final now = DateTime.now();
  return Resume(
    id: generateId(),
    name: name,
    sectionOrder: List.of(defaultSectionOrder),
    styling: TemplateRegistry.byId(templateId).recommendedStyling(),
    createdAt: now,
    updatedAt: now,
  );
}

/// Returns [resume]'s `sectionOrder` with any newly-supported core section
/// keys that might be missing (defensive against future schema additions)
/// and with `key` inserted if it isn't already present.
List<String> sectionOrderWithEnabled(List<String> sectionOrder, String key) {
  if (sectionOrder.contains(key)) return sectionOrder;
  return [...sectionOrder, key];
}

List<String> sectionOrderWithoutKey(List<String> sectionOrder, String key) {
  return sectionOrder.where((k) => k != key).toList();
}

/// True if [key] refers to a section that currently has any content /
/// is a core section (used to decide whether it should render at all).
bool isCoreSectionKey(String key) =>
    coreSectionTypes.any((type) => type.key == key);

import '../data/models/resume_styling.dart';

enum TemplateCategory {
  atsFriendly('ATS Friendly'),
  modern('Modern'),
  minimal('Minimal'),
  corporate('Corporate'),
  creative('Creative'),
  executive('Executive'),
  tech('Tech'),
  academic('Academic');

  const TemplateCategory(this.label);
  final String label;
}

class TemplateDefinition {
  const TemplateDefinition({
    required this.id,
    required this.name,
    required this.description,
    required this.categories,
    required this.isAtsFriendly,
    required this.recommendedColorPresetId,
    required this.recommendedFontFamily,
  });

  final String id;
  final String name;
  final String description;
  final List<TemplateCategory> categories;
  final bool isAtsFriendly;
  final String recommendedColorPresetId;
  final String recommendedFontFamily;

  ResumeStyling recommendedStyling() => ResumeStyling(
        templateId: id,
        colorPresetId: recommendedColorPresetId,
        fontFamily: recommendedFontFamily,
      );
}

/// The Phase 1 template catalogue. Adding a future template means adding one
/// entry here plus one `pw.Page` builder under `templates/<id>/` — the rest
/// of the app (gallery, editor, renderer dispatch) already knows how to
/// present and use it.
abstract final class TemplateRegistry {
  static const List<TemplateDefinition> all = [
    TemplateDefinition(
      id: 'ats_classic',
      name: 'ATS Classic',
      description: 'Extremely clean single-column layout, built for maximum ATS compatibility.',
      categories: [TemplateCategory.atsFriendly, TemplateCategory.minimal],
      isAtsFriendly: true,
      recommendedColorPresetId: 'black',
      recommendedFontFamily: ResumeFontFamilyIds.firaSans,
    ),
    TemplateDefinition(
      id: 'modern',
      name: 'Modern',
      description: 'Bold color header and modern typography for technology professionals.',
      categories: [TemplateCategory.modern, TemplateCategory.tech],
      isAtsFriendly: true,
      recommendedColorPresetId: 'navy',
      recommendedFontFamily: ResumeFontFamilyIds.firaSans,
    ),
    TemplateDefinition(
      id: 'executive',
      name: 'Executive',
      description: 'Refined, centered typography for senior and executive profiles.',
      categories: [TemplateCategory.executive, TemplateCategory.corporate],
      isAtsFriendly: true,
      recommendedColorPresetId: 'burgundy',
      recommendedFontFamily: ResumeFontFamilyIds.ptSerif,
    ),
  ];

  static TemplateDefinition byId(String id) =>
      all.firstWhere((t) => t.id == id, orElse: () => all.first);
}

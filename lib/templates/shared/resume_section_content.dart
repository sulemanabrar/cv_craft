import 'package:collection/collection.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../core/constants/section_types.dart';
import '../../data/models/resume.dart';
import '../../data/models/skill.dart';
import 'pdf_section_widgets.dart';
import 'pdf_theme.dart';

/// Renders the *content* (not the heading) for every resume section, shared
/// by all templates. Templates differ in page structure/header/spacing —
/// not in how an experience entry or a skill group is rendered — so this is
/// the single place that logic lives.
abstract final class ResumeSectionContent {
  static pw.Widget _spaced(List<pw.Widget> items, double gap) {
    final children = <pw.Widget>[];
    for (var i = 0; i < items.length; i++) {
      if (i > 0) children.add(pw.SizedBox(height: gap));
      children.add(items[i]);
    }
    return pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: children);
  }

  static pw.Widget summary(String text, ResumePdfTheme theme) {
    if (text.trim().isEmpty) return pw.SizedBox();
    return pw.Text(text.trim(), style: theme.bodyStyle);
  }

  static pw.Widget experienceList(Resume resume, ResumePdfTheme theme) {
    if (resume.experiences.isEmpty) return pw.SizedBox();
    return _spaced([
      for (final exp in resume.experiences)
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            PdfSectionWidgets.itemHeader(
              title: exp.jobTitle,
              subtitle: [
                exp.company,
                exp.location,
              ].where((s) => s.trim().isNotEmpty).join(' · '),
              dateText: PdfSectionWidgets.dateRange(
                start: exp.startDate,
                end: exp.endDate,
                isCurrent: exp.isCurrent,
              ),
              theme: theme,
            ),
            if (exp.description.trim().isNotEmpty) ...[
              pw.SizedBox(height: 4),
              PdfSectionWidgets.bulletList(
                PdfSectionWidgets.splitBullets(exp.description),
                theme,
              ),
            ],
          ],
        ),
    ], 10);
  }

  static pw.Widget educationList(Resume resume, ResumePdfTheme theme) {
    if (resume.education.isEmpty) return pw.SizedBox();
    return _spaced([
      for (final edu in resume.education)
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            PdfSectionWidgets.itemHeader(
              title: edu.degree,
              subtitle: [
                edu.institution,
                edu.location,
                if (edu.gradeOrGpa.trim().isNotEmpty) 'GPA: ${edu.gradeOrGpa}',
              ].where((s) => s.trim().isNotEmpty).join(' · '),
              dateText: PdfSectionWidgets.dateRange(
                start: edu.startDate,
                end: edu.endDate,
                isCurrent: edu.isCurrent,
              ),
              theme: theme,
            ),
            if (edu.description.trim().isNotEmpty) ...[
              pw.SizedBox(height: 4),
              pw.Text(edu.description, style: theme.bodyStyle),
            ],
          ],
        ),
    ], 8);
  }

  static pw.Widget skillsBlock(Resume resume, ResumePdfTheme theme) {
    if (resume.skills.isEmpty) return pw.SizedBox();
    final grouped = <String, List<Skill>>{};
    for (final skill in resume.skills) {
      grouped.putIfAbsent(skill.group, () => []).add(skill);
    }
    return _spaced([
      for (final entry in grouped.entries)
        pw.RichText(
          text: pw.TextSpan(
            children: [
              pw.TextSpan(
                text: '${entry.key}:  ',
                style: theme.itemTitleStyle,
              ),
              pw.TextSpan(
                text: entry.value
                    .map((s) => s.level != null
                        ? '${s.name} (${_levelLabel(s.level!)})'
                        : s.name)
                    .join('  •  '),
                style: theme.bodyStyle,
              ),
            ],
          ),
        ),
    ], 5);
  }

  static String _levelLabel(SkillLevel level) {
    switch (level) {
      case SkillLevel.beginner:
        return 'Beginner';
      case SkillLevel.intermediate:
        return 'Intermediate';
      case SkillLevel.advanced:
        return 'Advanced';
      case SkillLevel.expert:
        return 'Expert';
    }
  }

  static pw.Widget projectsList(Resume resume, ResumePdfTheme theme) {
    if (resume.projects.isEmpty) return pw.SizedBox();
    return _spaced([
      for (final project in resume.projects)
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            PdfSectionWidgets.itemHeader(
              title: project.name,
              subtitle: project.role,
              dateText: '',
              theme: theme,
            ),
            if (project.description.trim().isNotEmpty) ...[
              pw.SizedBox(height: 3),
              pw.Text(project.description, style: theme.bodyStyle),
            ],
            if (project.technologies.isNotEmpty) ...[
              pw.SizedBox(height: 3),
              pw.Text('Technologies: ${project.technologies.join(', ')}',
                  style: theme.metaStyle),
            ],
            if (project.url.trim().isNotEmpty || project.githubUrl.trim().isNotEmpty) ...[
              pw.SizedBox(height: 2),
              pw.Text(
                [project.url, project.githubUrl]
                    .where((s) => s.trim().isNotEmpty)
                    .join('   |   '),
                style: theme.metaStyle,
              ),
            ],
          ],
        ),
    ], 8);
  }

  static pw.Widget certificationsList(Resume resume, ResumePdfTheme theme) {
    if (resume.certifications.isEmpty) return pw.SizedBox();
    return _spaced([
      for (final cert in resume.certifications)
        PdfSectionWidgets.itemHeader(
          title: cert.name,
          subtitle: cert.issuer,
          dateText: cert.issueDate != null
              ? PdfSectionWidgets.dateRange(
                  start: cert.issueDate, end: null, isCurrent: false)
                  .replaceAll(' – ', '')
              : '',
          theme: theme,
        ),
    ], 6);
  }

  static pw.Widget languagesList(Resume resume, ResumePdfTheme theme) {
    if (resume.languages.isEmpty) return pw.SizedBox();
    return pw.Text(
      resume.languages.map((l) => '${l.name} (${l.proficiency})').join('  •  '),
      style: theme.bodyStyle,
    );
  }

  static pw.Widget awardsList(Resume resume, ResumePdfTheme theme) {
    if (resume.awards.isEmpty) return pw.SizedBox();
    return _spaced([
      for (final award in resume.awards)
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            PdfSectionWidgets.itemHeader(
              title: award.title,
              subtitle: award.issuer,
              dateText: award.date != null
                  ? PdfSectionWidgets.dateRange(start: award.date, end: null, isCurrent: false)
                      .replaceAll(' – ', '')
                  : '',
              theme: theme,
            ),
            if (award.description.trim().isNotEmpty)
              pw.Text(award.description, style: theme.bodyStyle),
          ],
        ),
    ], 6);
  }

  static pw.Widget achievementsList(Resume resume, ResumePdfTheme theme) {
    if (resume.achievements.isEmpty) return pw.SizedBox();
    return PdfSectionWidgets.bulletList(
      resume.achievements.map((a) => a.title).toList(),
      theme,
    );
  }

  static pw.Widget publicationsList(Resume resume, ResumePdfTheme theme) {
    if (resume.publications.isEmpty) return pw.SizedBox();
    return _spaced([
      for (final pub in resume.publications)
        PdfSectionWidgets.itemHeader(
          title: pub.title,
          subtitle: pub.publisher,
          dateText: pub.date != null
              ? PdfSectionWidgets.dateRange(start: pub.date, end: null, isCurrent: false)
                  .replaceAll(' – ', '')
              : '',
          theme: theme,
        ),
    ], 6);
  }

  static pw.Widget volunteerList(Resume resume, ResumePdfTheme theme) {
    if (resume.volunteerExperience.isEmpty) return pw.SizedBox();
    return _spaced([
      for (final vol in resume.volunteerExperience)
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            PdfSectionWidgets.itemHeader(
              title: vol.role,
              subtitle: [vol.organization, vol.location]
                  .where((s) => s.trim().isNotEmpty)
                  .join(' · '),
              dateText: PdfSectionWidgets.dateRange(
                start: vol.startDate,
                end: vol.endDate,
                isCurrent: vol.isCurrent,
              ),
              theme: theme,
            ),
            if (vol.description.trim().isNotEmpty)
              pw.Text(vol.description, style: theme.bodyStyle),
          ],
        ),
    ], 8);
  }

  static pw.Widget referencesList(Resume resume, ResumePdfTheme theme) {
    if (resume.references.isEmpty) return pw.SizedBox();
    return _spaced([
      for (final ref in resume.references)
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(ref.name, style: theme.itemTitleStyle),
            pw.Text(
              [ref.relationship, ref.company]
                  .where((s) => s.trim().isNotEmpty)
                  .join(', '),
              style: theme.bodyStyle,
            ),
            pw.Text(
              [ref.email, ref.phone].where((s) => s.trim().isNotEmpty).join('   |   '),
              style: theme.metaStyle,
            ),
          ],
        ),
    ], 8);
  }

  static pw.Widget interestsList(Resume resume, ResumePdfTheme theme) {
    if (resume.interests.isEmpty) return pw.SizedBox();
    return pw.Text(
      resume.interests.map((i) => i.name).join('  •  '),
      style: theme.bodyStyle,
    );
  }

  static pw.Widget? customSection(Resume resume, String key, ResumePdfTheme theme) {
    final id = customSectionIdFromKey(key);
    final section = resume.customSections.where((s) => s.id == id).firstOrNull;
    if (section == null || section.items.isEmpty) return null;
    return _spaced([
      for (final item in section.items)
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(item.title, style: theme.itemTitleStyle),
            if (item.description.trim().isNotEmpty)
              pw.Text(item.description, style: theme.bodyStyle),
          ],
        ),
    ], 6);
  }

  /// Title to show for a `sectionOrder` key — custom sections use their
  /// user-defined title, fixed sections use their standard ATS-safe label.
  static String titleFor(Resume resume, String key) {
    if (isCustomSectionKey(key)) {
      final id = customSectionIdFromKey(key);
      final section = resume.customSections.where((s) => s.id == id).firstOrNull;
      return section?.title ?? 'Custom Section';
    }
    return ResumeSectionType.fromKey(key)?.label ?? key;
  }

  /// Returns the rendered content widget for [key], or null if the section
  /// has no content and should be skipped entirely (never render an empty
  /// heading with nothing under it).
  static pw.Widget? contentFor(Resume resume, String key, ResumePdfTheme theme) {
    if (isCustomSectionKey(key)) return customSection(resume, key, theme);

    final type = ResumeSectionType.fromKey(key);
    switch (type) {
      case ResumeSectionType.summary:
        return resume.summary.trim().isEmpty ? null : summary(resume.summary, theme);
      case ResumeSectionType.experience:
        return resume.experiences.isEmpty ? null : experienceList(resume, theme);
      case ResumeSectionType.education:
        return resume.education.isEmpty ? null : educationList(resume, theme);
      case ResumeSectionType.skills:
        return resume.skills.isEmpty ? null : skillsBlock(resume, theme);
      case ResumeSectionType.projects:
        return resume.projects.isEmpty ? null : projectsList(resume, theme);
      case ResumeSectionType.certifications:
        return resume.certifications.isEmpty ? null : certificationsList(resume, theme);
      case ResumeSectionType.languages:
        return resume.languages.isEmpty ? null : languagesList(resume, theme);
      case ResumeSectionType.awards:
        return resume.awards.isEmpty ? null : awardsList(resume, theme);
      case ResumeSectionType.achievements:
        return resume.achievements.isEmpty ? null : achievementsList(resume, theme);
      case ResumeSectionType.publications:
        return resume.publications.isEmpty ? null : publicationsList(resume, theme);
      case ResumeSectionType.volunteerExperience:
        return resume.volunteerExperience.isEmpty ? null : volunteerList(resume, theme);
      case ResumeSectionType.references:
        return resume.references.isEmpty ? null : referencesList(resume, theme);
      case ResumeSectionType.interests:
        return resume.interests.isEmpty ? null : interestsList(resume, theme);
      case null:
        return null;
    }
  }
}

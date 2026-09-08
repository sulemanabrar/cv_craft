import '../../templates/template_registry.dart';
import '../models/models.dart';

/// A single, realistic, fully-populated sample resume used everywhere the
/// app needs to show "what a real CV looks like" without depending on user
/// data — the Templates gallery cards, the template detail/preview screen,
/// and renderer smoke tests. Kept as one shared fixture so every template's
/// preview is built from identical content and only the layout differs.
Resume buildSampleResume({String templateId = 'ats_classic'}) {
  final now = DateTime.now();
  return Resume(
    id: 'sample',
    name: 'Sample Resume',
    personalInfo: const PersonalInfo(
      fullName: 'Jordan Casey',
      professionalTitle: 'Senior Product Designer',
      email: 'jordan.casey@email.com',
      phone: '+1 (555) 012-3456',
      location: 'San Francisco, CA',
      linkedIn: 'linkedin.com/in/jordancasey',
      portfolio: 'jordancasey.design',
      github: '',
      website: '',
    ),
    summary:
        'Product designer with 8+ years crafting intuitive, high-impact digital '
        'products for consumer and B2B SaaS companies. Skilled at translating '
        'complex requirements into simple, elegant user experiences and '
        'partnering closely with engineering and product to ship fast.',
    experiences: [
      Experience(
        id: 'exp1',
        jobTitle: 'Senior Product Designer',
        company: 'Northwind Software',
        location: 'San Francisco, CA',
        startDate: DateTime(2021, 4, 1),
        isCurrent: true,
        description:
            'Led end-to-end design for the core billing platform used by 50k+ businesses.\n'
            'Partnered with engineering to launch a redesigned onboarding flow, improving activation by 22%.\n'
            'Mentored two junior designers and established the team\'s first component library.',
      ),
      Experience(
        id: 'exp2',
        jobTitle: 'Product Designer',
        company: 'Fieldstone Labs',
        location: 'Oakland, CA',
        startDate: DateTime(2018, 6, 1),
        endDate: DateTime(2021, 3, 1),
        description:
            'Designed and shipped the mobile companion app from 0 to 1, reaching 100k downloads in year one.\n'
            'Ran quarterly usability studies that directly informed the product roadmap.',
      ),
    ],
    education: [
      Education(
        id: 'edu1',
        degree: 'B.F.A. in Interaction Design',
        institution: 'California College of the Arts',
        location: 'San Francisco, CA',
        startDate: DateTime(2014, 8, 1),
        endDate: DateTime(2018, 5, 1),
      ),
    ],
    skills: const [
      Skill(id: 'sk1', name: 'Product Strategy', group: 'Technical Skills'),
      Skill(id: 'sk2', name: 'Figma', group: 'Tools'),
      Skill(id: 'sk3', name: 'Prototyping', group: 'Tools'),
      Skill(id: 'sk4', name: 'Design Systems', group: 'Technical Skills'),
      Skill(id: 'sk5', name: 'Cross-functional Collaboration', group: 'Soft Skills'),
    ],
    projects: [
      Project(
        id: 'proj1',
        name: 'Component Library Overhaul',
        role: 'Design Lead',
        description: 'Rebuilt the company-wide design system used across 6 product teams.',
        technologies: const ['Figma', 'Storybook'],
      ),
    ],
    certifications: [
      Certification(
        id: 'cert1',
        name: 'Certified Usability Analyst',
        issuer: 'Human Factors International',
        issueDate: DateTime(2020, 9, 1),
      ),
    ],
    sectionOrder: [...defaultSectionOrder, 'certifications'],
    enabledOptionalSections: const {'certifications'},
    styling: TemplateRegistry.byId(templateId).recommendedStyling(),
    createdAt: now,
    updatedAt: now,
  );
}

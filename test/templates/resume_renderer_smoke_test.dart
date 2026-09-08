import 'package:cv_maker/data/fixtures/sample_resume_fixture.dart';
import 'package:cv_maker/templates/resume_renderer.dart';
import 'package:cv_maker/templates/template_registry.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  for (final template in TemplateRegistry.all) {
    test('${template.name} renders a non-empty PDF document', () async {
      final resume = buildSampleResume(templateId: template.id);
      final doc = await ResumeRenderer.build(resume);
      final bytes = await doc.save();
      expect(bytes, isNotEmpty);
    });
  }
}

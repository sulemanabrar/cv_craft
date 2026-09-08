import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/design/app_spacing.dart';
import '../../../core/design/widgets/app_text_field.dart';
import '../../../state/resume_editor/resume_editor_provider.dart';

const _exampleSummaries = [
  'Results-driven software engineer with 5+ years building scalable web '
      'applications. Skilled in translating business requirements into '
      'clean, maintainable code and mentoring junior developers.',
  'Creative product designer passionate about crafting intuitive user '
      'experiences. Combines user research with strong visual design to '
      'ship products that customers love.',
];

class SummaryEditor extends ConsumerStatefulWidget {
  const SummaryEditor({super.key, required this.resumeId});

  final String resumeId;

  @override
  ConsumerState<SummaryEditor> createState() => _SummaryEditorState();
}

class _SummaryEditorState extends ConsumerState<SummaryEditor> {
  late final TextEditingController _controller = TextEditingController(
    text: ref.read(resumeEditorProvider(widget.resumeId)).summary,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _setSummary(String value) {
    _controller.value = TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
    ref.read(resumeEditorProvider(widget.resumeId).notifier).updateSummary(value);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppTextField(
          controller: _controller,
          multiline: true,
          minLines: 4,
          maxLines: 8,
          hintText: 'A 2-4 sentence overview of your experience and strengths.',
          onChanged: (v) => ref
              .read(resumeEditorProvider(widget.resumeId).notifier)
              .updateSummary(v),
        ),
        const SizedBox(height: AppSpacing.xxs),
        ValueListenableBuilder<TextEditingValue>(
          valueListenable: _controller,
          builder: (context, value, _) {
            final trimmed = value.text.trim();
            final wordCount = trimmed.isEmpty ? 0 : trimmed.split(RegExp(r'\s+')).length;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$wordCount words',
                  style: theme.textTheme.labelSmall
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
                if (trimmed.isEmpty) ...[
                  const SizedBox(height: AppSpacing.xs),
                  Text('Need inspiration? Try an example:', style: theme.textTheme.labelSmall),
                  const SizedBox(height: AppSpacing.xxs),
                  for (final example in _exampleSummaries)
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _setSummary(example),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: theme.dividerColor),
                          ),
                          child: Text(
                            example,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                    ),
                ],
              ],
            );
          },
        ),
      ],
    );
  }
}

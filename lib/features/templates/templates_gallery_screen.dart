import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/design/app_spacing.dart';
import '../../templates/template_registry.dart';
import 'widgets/template_card.dart';

/// The Templates gallery. Reused both as the "Templates" bottom-nav tab and
/// as the first step of the "Create New CV" flow (pushed at `/create`) —
/// [basePath] decides where tapping a template card navigates to, so the
/// same screen naturally supports both entry points.
class TemplatesGalleryScreen extends StatefulWidget {
  const TemplatesGalleryScreen({
    super.key,
    this.basePath = '/templates',
    this.title = 'Templates',
    this.showAppBar = false,
  });

  final String basePath;
  final String title;
  final bool showAppBar;

  @override
  State<TemplatesGalleryScreen> createState() => _TemplatesGalleryScreenState();
}

class _TemplatesGalleryScreenState extends State<TemplatesGalleryScreen> {
  TemplateCategory? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final templates = TemplateRegistry.all
        .where((t) => _selectedCategory == null || t.categories.contains(_selectedCategory))
        .toList();

    final body = SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, 0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!widget.showAppBar) ...[
                    Text(widget.title, style: theme.textTheme.headlineSmall),
                    const SizedBox(height: AppSpacing.xs),
                  ],
                  Text(
                    'Every template shares the same content — switching later never loses your data.',
                    style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  SizedBox(
                    height: 36,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _CategoryChip(
                          label: 'All',
                          selected: _selectedCategory == null,
                          onTap: () => setState(() => _selectedCategory = null),
                        ),
                        for (final category in TemplateCategory.values)
                          Padding(
                            padding: const EdgeInsets.only(left: AppSpacing.xs),
                            child: _CategoryChip(
                              label: category.label,
                              selected: _selectedCategory == category,
                              onTap: () => setState(() => _selectedCategory = category),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.xxxl),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: AppSpacing.sm,
                crossAxisSpacing: AppSpacing.sm,
                childAspectRatio: 0.62,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final template = templates[index];
                  return TemplateCard(
                    template: template,
                    onTap: () => context.push('${widget.basePath}/template/${template.id}'),
                  );
                },
                childCount: templates.length,
              ),
            ),
          ),
        ],
      ),
    );

    if (!widget.showAppBar) return Scaffold(body: body);
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: body,
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) => onTap(),
    );
  }
}

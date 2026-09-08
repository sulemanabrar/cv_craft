/// Declarative field schema every generic repeatable-list section is built
/// from — the add/edit bottom sheet form and the summary card are both
/// generated from a list of these, so adding a new list-type section is a
/// matter of writing one schema file, not a new screen.
enum FieldInputType { text, multiline, date, toggle, dropdown }

class FieldSchema {
  const FieldSchema({
    required this.key,
    required this.label,
    required this.type,
    this.placeholder,
    this.dropdownOptions,
    this.visibleWhen,
  });

  final String key;
  final String label;
  final FieldInputType type;
  final String? placeholder;
  final List<String>? dropdownOptions;

  /// Lets a field hide itself based on other field values in the same item
  /// — e.g. an experience's "End Date" hides when "Currently working here"
  /// is toggled on.
  final bool Function(Map<String, dynamic> item)? visibleWhen;

  bool isVisible(Map<String, dynamic> item) => visibleWhen?.call(item) ?? true;
}

/// Everything the generic editor needs to render one repeatable list
/// section: its fields, how to summarize an item as a card, and its
/// empty-state copy.
class RepeatableSectionSchema {
  const RepeatableSectionSchema({
    required this.sectionTitle,
    required this.fields,
    required this.titleBuilder,
    required this.subtitleBuilder,
    required this.emptyItemBuilder,
    required this.emptyStateTitle,
    required this.emptyStateBody,
    required this.addButtonLabel,
    this.detailBuilder,
  });

  final String sectionTitle;
  final List<FieldSchema> fields;
  final String Function(Map<String, dynamic> item) titleBuilder;
  final String? Function(Map<String, dynamic> item) subtitleBuilder;
  final String? Function(Map<String, dynamic> item)? detailBuilder;
  final Map<String, dynamic> Function() emptyItemBuilder;
  final String emptyStateTitle;
  final String emptyStateBody;
  final String addButtonLabel;
}

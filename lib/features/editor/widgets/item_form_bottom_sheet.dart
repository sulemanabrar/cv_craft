import 'package:flutter/material.dart';

import '../../../core/design/app_spacing.dart';
import '../../../core/design/widgets/app_bottom_sheet.dart';
import '../../../core/design/widgets/app_date_field.dart';
import '../../../core/design/widgets/app_dropdown.dart';
import '../../../core/design/widgets/app_text_field.dart';
import '../../../core/design/widgets/app_toggle_row.dart';
import '../../../core/design/widgets/primary_button.dart';
import '../schemas/field_schema.dart';

/// Renders an add/edit form for one repeatable-list item, driven entirely
/// by [RepeatableSectionSchema.fields]. Returns the edited item map, or
/// null if the user cancelled.
Future<Map<String, dynamic>?> showItemFormSheet({
  required BuildContext context,
  required RepeatableSectionSchema schema,
  required Map<String, dynamic> initialItem,
  required bool isNew,
}) {
  return showAppBottomSheet<Map<String, dynamic>>(
    context: context,
    title: isNew ? 'Add to ${schema.sectionTitle}' : 'Edit ${schema.sectionTitle}',
    builder: (context) => _ItemForm(schema: schema, initialItem: initialItem),
  );
}

class _ItemForm extends StatefulWidget {
  const _ItemForm({required this.schema, required this.initialItem});

  final RepeatableSectionSchema schema;
  final Map<String, dynamic> initialItem;

  @override
  State<_ItemForm> createState() => _ItemFormState();
}

class _ItemFormState extends State<_ItemForm> {
  final Map<String, dynamic> _values = {};
  late final Map<String, TextEditingController> _controllers;

  @override
  void initState() {
    super.initState();
    _values.addAll(widget.initialItem);
    _controllers = {
      for (final field in widget.schema.fields)
        if (field.type == FieldInputType.text || field.type == FieldInputType.multiline)
          field.key: TextEditingController(text: _values[field.key]?.toString() ?? ''),
    };
  }

  @override
  void dispose() {
    for (final controller in _controllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  void _set(String key, dynamic value) {
    setState(() => _values[key] = value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final field in widget.schema.fields)
          if (field.isVisible(_values))
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.sm),
              child: _buildField(field),
            ),
        const SizedBox(height: AppSpacing.xs),
        PrimaryButton(
          label: 'Save',
          expand: true,
          onPressed: () => Navigator.of(context).pop(_values),
        ),
      ],
    );
  }

  Widget _buildField(FieldSchema field) {
    switch (field.type) {
      case FieldInputType.text:
        return AppTextField(
          controller: _controllers[field.key],
          label: field.label,
          hintText: field.placeholder,
          onChanged: (v) => _values[field.key] = v,
        );
      case FieldInputType.multiline:
        return AppTextField(
          controller: _controllers[field.key],
          label: field.label,
          hintText: field.placeholder,
          multiline: true,
          onChanged: (v) => _values[field.key] = v,
        );
      case FieldInputType.date:
        final raw = _values[field.key];
        final date = raw is DateTime ? raw : null;
        return AppDateField(
          label: field.label,
          value: date,
          onChanged: (value) => _set(field.key, value),
        );
      case FieldInputType.toggle:
        final value = _values[field.key] == true;
        return AppToggleRow(
          label: field.label,
          value: value,
          onChanged: (v) => _set(field.key, v),
        );
      case FieldInputType.dropdown:
        final options = field.dropdownOptions ?? const [];
        final current = _values[field.key]?.toString() ?? (options.isNotEmpty ? options.first : '');
        return AppDropdown<String>(
          label: field.label,
          value: current,
          items: options,
          itemLabel: (v) => v,
          onChanged: (v) => _set(field.key, v),
        );
    }
  }
}

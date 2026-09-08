import 'package:flutter/material.dart';

import '../app_spacing.dart';

/// A simple add/remove chip control — type a value, press enter/done to add
/// it as a chip, tap a chip's close icon to remove it.
class ChipInput extends StatefulWidget {
  const ChipInput({
    super.key,
    required this.values,
    required this.onChanged,
    this.label,
    this.hintText = 'Add and press enter',
  });

  final List<String> values;
  final ValueChanged<List<String>> onChanged;
  final String? label;
  final String hintText;

  @override
  State<ChipInput> createState() => _ChipInputState();
}

class _ChipInputState extends State<ChipInput> {
  final _controller = TextEditingController();

  void _add(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return;
    if (widget.values.contains(trimmed)) {
      _controller.clear();
      return;
    }
    widget.onChanged([...widget.values, trimmed]);
    _controller.clear();
  }

  void _remove(String value) {
    widget.onChanged(widget.values.where((v) => v != value).toList());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: widget.label, hintText: widget.hintText),
          onSubmitted: _add,
        ),
        if (widget.values.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xs),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final value in widget.values)
                Chip(
                  label: Text(value),
                  onDeleted: () => _remove(value),
                ),
            ],
          ),
        ],
      ],
    );
  }
}

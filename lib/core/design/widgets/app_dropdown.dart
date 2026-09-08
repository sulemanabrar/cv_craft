import 'package:flutter/material.dart';

class AppDropdown<T> extends StatelessWidget {
  const AppDropdown({
    super.key,
    required this.value,
    required this.items,
    required this.itemLabel,
    required this.onChanged,
    this.label,
  });

  final T value;
  final List<T> items;
  final String Function(T) itemLabel;
  final ValueChanged<T> onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: value,
      decoration: InputDecoration(labelText: label),
      items: [
        for (final item in items)
          DropdownMenuItem(value: item, child: Text(itemLabel(item))),
      ],
      onChanged: (v) {
        if (v != null) onChanged(v);
      },
    );
  }
}

import 'package:flutter/material.dart';

import '../../utils/date_format_utils.dart';

/// A tappable field that opens a month/year-focused date picker. Resume
/// dates only ever need month + year precision.
class AppDateField extends StatelessWidget {
  const AppDateField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.enabled = true,
  });

  final String label;
  final DateTime? value;
  final ValueChanged<DateTime?> onChanged;
  final bool enabled;

  Future<void> _pick(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: value ?? DateTime(now.year, now.month),
      firstDate: DateTime(1960),
      lastDate: DateTime(now.year + 10),
      helpText: label,
      initialDatePickerMode: DatePickerMode.year,
    );
    if (picked != null) onChanged(DateTime(picked.year, picked.month));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: enabled ? () => _pick(context) : null,
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          enabled: enabled,
          suffixIcon: const Icon(Icons.calendar_today_outlined, size: 18),
        ),
        child: Text(
          value != null ? DateFormatUtils.monthYear(value!) : 'Select date',
          style: value == null
              ? Theme.of(context).inputDecorationTheme.hintStyle
              : null,
        ),
      ),
    );
  }
}

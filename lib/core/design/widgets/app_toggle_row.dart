import 'package:flutter/material.dart';

class AppToggleRow extends StatelessWidget {
  const AppToggleRow({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: () => onChanged(!value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(child: Text(label, style: Theme.of(context).textTheme.bodyMedium)),
            Switch(value: value, onChanged: onChanged),
          ],
        ),
      ),
    );
  }
}

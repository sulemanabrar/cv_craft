import 'package:flutter/material.dart';

/// A single-line text-input dialog — used for renaming a CV, naming a new
/// CV, or naming a custom section.
Future<String?> showTextInputDialog({
  required BuildContext context,
  required String title,
  String? initialValue,
  String confirmLabel = 'Save',
  String hintText = '',
}) async {
  final result = await showDialog<String>(
    context: context,
    builder: (context) => _TextInputDialog(
      title: title,
      initialValue: initialValue,
      confirmLabel: confirmLabel,
      hintText: hintText,
    ),
  );
  final trimmed = result?.trim();
  return (trimmed == null || trimmed.isEmpty) ? null : trimmed;
}

class _TextInputDialog extends StatefulWidget {
  const _TextInputDialog({
    required this.title,
    required this.initialValue,
    required this.confirmLabel,
    required this.hintText,
  });

  final String title;
  final String? initialValue;
  final String confirmLabel;
  final String hintText;

  @override
  State<_TextInputDialog> createState() => _TextInputDialogState();
}

class _TextInputDialogState extends State<_TextInputDialog> {
  // Owned by this State and disposed in dispose() so its lifecycle is tied
  // to the dialog route's actual removal — disposing it manually right
  // after showDialog() returns races the route's closing transition and
  // crashes with "used after being disposed".
  late final TextEditingController _controller =
      TextEditingController(text: widget.initialValue);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _controller,
        autofocus: true,
        decoration: InputDecoration(hintText: widget.hintText),
        onSubmitted: (value) => Navigator.of(context).pop(value),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: Text(widget.confirmLabel),
        ),
      ],
    );
  }
}

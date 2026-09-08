import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.expand = false,
    this.loading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expand;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final child = loading
        ? const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(strokeWidth: 2.2, color: Colors.white),
          )
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 18),
                const SizedBox(width: 8),
              ],
              Text(label),
            ],
          );

    final button = ElevatedButton(
      onPressed: loading ? null : onPressed,
      child: child,
    );

    return expand ? SizedBox(width: double.infinity, child: button) : button;
  }
}

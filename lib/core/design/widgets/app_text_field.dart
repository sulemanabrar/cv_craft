import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.helperText,
    this.multiline = false,
    this.minLines,
    this.maxLines,
    this.keyboardType,
    this.onChanged,
    this.textCapitalization = TextCapitalization.none,
    this.suffix,
    this.autofocus = false,
    this.obscureText = false,
    this.errorText,
    this.onSubmitted,
    this.textInputAction,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final String? helperText;
  final bool multiline;
  final int? minLines;
  final int? maxLines;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final TextCapitalization textCapitalization;
  final Widget? suffix;
  final bool autofocus;
  final bool obscureText;
  final String? errorText;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: autofocus,
      obscureText: obscureText,
      minLines: multiline ? (minLines ?? 3) : 1,
      maxLines: obscureText ? 1 : (multiline ? (maxLines ?? 6) : 1),
      keyboardType: keyboardType ?? (multiline ? TextInputType.multiline : TextInputType.text),
      textCapitalization: textCapitalization,
      textInputAction: textInputAction,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
        hintText: hintText,
        helperText: helperText,
        errorText: errorText,
        suffixIcon: suffix,
      ),
    );
  }
}

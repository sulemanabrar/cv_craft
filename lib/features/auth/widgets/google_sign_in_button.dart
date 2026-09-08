import 'package:flutter/material.dart';

import '../../../core/design/app_spacing.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, required this.onPressed, this.loading = false});

  final VoidCallback? onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: loading ? null : onPressed,
        child: loading
            ? const SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(strokeWidth: 2.2),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.g_mobiledata_rounded, size: 22),
                  const SizedBox(width: AppSpacing.sm),
                  const Text('Continue with Google'),
                ],
              ),
      ),
    );
  }
}

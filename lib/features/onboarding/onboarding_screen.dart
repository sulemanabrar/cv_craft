import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/route_paths.dart';
import '../../core/design/app_spacing.dart';
import '../../core/design/widgets/primary_button.dart';
import '../../state/settings/onboarding_provider.dart';

class _OnboardingSlide {
  const _OnboardingSlide(this.icon, this.title, this.subtitle);
  final IconData icon;
  final String title;
  final String subtitle;
}

const _slides = [
  _OnboardingSlide(
    Icons.rocket_launch_outlined,
    'Build your professional future.',
    'Create polished, job-ready resumes in minutes, not hours.',
  ),
  _OnboardingSlide(
    Icons.dashboard_customize_outlined,
    'Choose from professionally designed templates.',
    'Every template shares your content — switch anytime, never lose your work.',
  ),
  _OnboardingSlide(
    Icons.fact_check_outlined,
    'Create ATS-friendly resumes.',
    'Every layout is built to pass applicant tracking systems cleanly.',
  ),
  _OnboardingSlide(
    Icons.send_outlined,
    'Export and apply with confidence.',
    'Download a pixel-perfect PDF that looks exactly like your live preview.',
  ),
];

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  int _page = 0;

  void _finish() {
    ref.read(onboardingSeenProvider.notifier).markSeen();
    context.go(RoutePaths.home);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLast = _page == _slides.length - 1;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.sm),
                child: TextButton(onPressed: _finish, child: const Text('Skip')),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: _slides.length,
                onPageChanged: (page) => setState(() => _page = page),
                itemBuilder: (context, index) {
                  final slide = _slides[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 96,
                          height: 96,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary.withValues(alpha: 0.08),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(slide.icon, size: 40, color: theme.colorScheme.primary),
                        ),
                        const SizedBox(height: AppSpacing.xl),
                        Text(
                          slide.title,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.headlineSmall,
                        ),
                        const SizedBox(height: AppSpacing.sm),
                        Text(
                          slide.subtitle,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (var i = 0; i < _slides.length; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: i == _page ? 20 : 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: i == _page
                          ? theme.colorScheme.primary
                          : theme.colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: PrimaryButton(
                label: isLast ? 'Create My CV' : 'Next',
                expand: true,
                onPressed: () {
                  if (isLast) {
                    _finish();
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeOut,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

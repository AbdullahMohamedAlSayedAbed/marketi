import 'package:flutter/material.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/services/shared_prefs.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/storage_key.dart';
import 'package:marketi/features/onboarding/views/widgets/item_onboarding_widget.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _controller;
  int _currentPage = 0;
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  void _onNextPressed(int index) {
    if (index == _onboardingItems.length - 1) {
      context.pushReplacementNamed(AppRouter.login);
      CacheHelper().put(key: StorageKey.onboarding, value: true);
    } else {
      _controller.animateToPage(
        index + 1,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          itemCount: _onboardingItems.length,
          onPageChanged: (index) {
            setState(() => _currentPage = index);
          },
          itemBuilder: (context, index) {
            return ItemOnboardingWidget(
              index: _currentPage,
              item: _onboardingItems[index],
              onPressed: () => _onNextPressed(index),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<({String description, String image, String textBut, String title})>
  get _onboardingItems => [
    (
      image: Assets.imagesIllustrationOnboarding1,
      title: AppStrings.onboardingTitle1,
      description: AppStrings.onboardingDescription1,
      textBut: AppStrings.next,
    ),
    (
      image: Assets.imagesIllustrationOnboarding2,
      title: AppStrings.onboardingTitle2,
      description: AppStrings.onboardingDescription2,
      textBut: AppStrings.next,
    ),
    (
      image: Assets.imagesIllustrationOnboarding3,
      title: AppStrings.onboardingTitle3,
      description: AppStrings.onboardingDescription3,
      textBut: AppStrings.getStarted,
    ),
  ];
}

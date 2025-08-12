import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/services/shared_prefs.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/storage_key.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    navigateTo();
    super.initState();
  }

  Future<void> navigateTo() async {
    await CacheHelper().init();
    final bool isOnboardingCompleted =
        CacheHelper().getData(key: StorageKey.onboarding) ?? false;
    return Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      if (isOnboardingCompleted) {
        context.pushReplacementNamed(AppRouter.login);
      } else {
        context.pushReplacementNamed(AppRouter.onBoarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeInDown(
        duration: const Duration(milliseconds: 800),
        child: Image.asset(Assets.imagesLogoSplashScreen),
      ),
    );
  }
}

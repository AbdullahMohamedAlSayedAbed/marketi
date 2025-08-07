import 'package:flutter/material.dart';
import 'package:marketi/features/auth/presentation/views/login_view.dart';
import 'package:marketi/features/auth/presentation/views/signup_view.dart';
import 'package:marketi/features/onboarding/views/onboarding_view.dart';
import 'package:marketi/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const String splash = 'splash';
  static const String onBoarding = 'onBoarding';
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String forgotPassword = 'forgotPassword';
  static const String changePassword = 'changePasswordView';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case onBoarding:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case signUp:
        return MaterialPageRoute(builder: (context) => const SignupView());
      // case forgotPassword:
      //   return MaterialPageRoute(
      //     builder: (context) => const ForgotPasswordView(),
      //   );

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}

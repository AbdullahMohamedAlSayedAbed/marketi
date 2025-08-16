import 'package:flutter/material.dart';
import 'package:marketi/features/auth/presentation/views/congratulations_view.dart';
import 'package:marketi/features/auth/presentation/views/create_new_password.dart';
import 'package:marketi/features/auth/presentation/views/forget_password_with_phone_view.dart';
import 'package:marketi/features/auth/presentation/views/forgot_password_with_email.dart';
import 'package:marketi/features/auth/presentation/views/login_view.dart';
import 'package:marketi/features/auth/presentation/views/signup_view.dart';
import 'package:marketi/features/auth/presentation/views/verification_code_email_view.dart';
import 'package:marketi/features/auth/presentation/views/verification_code_view.dart';
import 'package:marketi/features/home/presentation/views/home_view.dart';
import 'package:marketi/features/home/presentation/views/popular_product_view.dart';
import 'package:marketi/features/onboarding/views/onboarding_view.dart';
import 'package:marketi/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const String splash = 'splash';
  static const String onBoarding = 'onBoarding';
  static const String login = 'login';
  static const String signUp = 'signUp';
  static const String home = 'home';
  static const String forgotPasswordPhone = 'forgotPasswordWithPhone';
  static const String forgotPasswordEmail = 'forgotPasswordWithEmail';
  static const String createNewPassword = 'Create New Password';
  static const String congratulations = 'CongratulationsView';
  static const String changePassword = 'changePasswordView';
  static const String verificationCode = 'verificationCodeView';
  static const String verificationCodeEmail = 'verificationCodeEmail';
  static const String popularProductView = 'PopularProductView';
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
      case forgotPasswordPhone:
        return MaterialPageRoute(
          builder: (context) => const ForgetPasswordWithPhoneView(),
        );
      case forgotPasswordEmail:
        return MaterialPageRoute(
          builder: (context) => const ForgotPasswordWithEmail(),
        );
      case verificationCode:
        return MaterialPageRoute(
          builder: (context) => const VerificationCodePhoneView(),
        );
      case verificationCodeEmail:
        return MaterialPageRoute(
          builder: (context) =>
              VerificationCodeEmailView(email: settings.arguments as String),
        );
      case createNewPassword:
        return MaterialPageRoute(
          builder: (context) =>
              CreateNewPasswordView(email: settings.arguments as String?),
        );
      case home:
        return MaterialPageRoute(builder: (context) => HomeView());

      case congratulations:
        return MaterialPageRoute(
          builder: (context) => const CongratulationsView(),
        );
      case popularProductView:
        return MaterialPageRoute(
          builder: (context) => const PopularProductView(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}

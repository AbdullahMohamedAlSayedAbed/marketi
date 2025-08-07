import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/features/auth/presentation/views/widgets/password_field.dart';
import 'package:marketi/features/auth/presentation/views/widgets/title_text_sign_up.dart';

class PasswordConfirmCreateNewPassword extends StatelessWidget {
  const PasswordConfirmCreateNewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextSignUp(title: AppStrings.password),
        PasswordField(),
        TitleTextSignUp(title: AppStrings.confirmPassword),
        PasswordField(),
      ],
    );
  }
}

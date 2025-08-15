import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/features/auth/presentation/views/widgets/password_field.dart';
import 'package:marketi/features/auth/presentation/views/widgets/title_text_sign_up.dart';

class PasswordConfirmCreateNewPassword extends StatelessWidget {
  const PasswordConfirmCreateNewPassword({
    super.key,
    required this.onSavedPassword,
    required this.onSavedPasswordConfirm,
  });
  final void Function(String?)? onSavedPassword;
  final void Function(String?)? onSavedPasswordConfirm;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextSignUp(title: AppStrings.password),
        PasswordField(onSaved: onSavedPassword),
        TitleTextSignUp(title: AppStrings.confirmPassword),
        PasswordField(onSaved: onSavedPasswordConfirm),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/styles_app.dart';

class RememberMeAndForgetPassword extends StatefulWidget {
  const RememberMeAndForgetPassword({super.key, this.onRememberMeChanged});
  final ValueChanged<bool>? onRememberMeChanged;
  @override
  State<RememberMeAndForgetPassword> createState() =>
      _RememberMeAndForgetPasswordState();
}

class _RememberMeAndForgetPasswordState
    extends State<RememberMeAndForgetPassword> {
  bool isRememberMeChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: AppColors.primaryColor,
          value: isRememberMeChecked,
          onChanged: (value) {
            setState(() {
              isRememberMeChecked = value ?? false;
            });
            widget.onRememberMeChanged?.call(isRememberMeChecked);
          },
        ),
        Text(
          AppStrings.rememberMe,
          style: AppStyles().style12w400.copyWith(color: AppColors.navyColor),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            context.pushNamed(AppRouter.forgotPasswordPhone);
          },
          child: Text(
            AppStrings.forgotPassword,
            style: AppStyles().style12w500.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

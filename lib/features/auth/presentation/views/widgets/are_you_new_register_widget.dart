import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/styles_app.dart';

class AreYouNewRegisterWidget extends StatelessWidget {
  const AreYouNewRegisterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppStrings.areYouNew,
            style: AppStyles().style12w400.copyWith(
              color: AppColors.navyColor,
              height: 1.34,
            ),
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, AppRouter.signUp);
              },
            text: 'register?',
            style: AppStyles().style12w400.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}

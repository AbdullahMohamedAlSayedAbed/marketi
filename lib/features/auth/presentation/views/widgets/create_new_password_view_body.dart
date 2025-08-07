import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';
import 'package:marketi/features/auth/presentation/views/widgets/app_bar_forget_password.dart';
import 'package:marketi/features/auth/presentation/views/widgets/password_confirm_create_new_password.dart';

class CreateNewPasswordViewBody extends StatelessWidget {
  const CreateNewPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(
            spacing: 22,
            children: [
              AppBarForgetPassword(title: 'Create New Password'),
              SizedBox.shrink(),
              SvgPicture.asset(Assets.imagesIllustrationCreateNewPassword),
              Text(
                'New password must be different from last password',
                textAlign: TextAlign.center,
                style: AppStyles().style16w500.copyWith(
                  color: AppColors.navyColor,
                ),
              ).paddingSymmetric(horizontalPadding: 34),
              PasswordConfirmCreateNewPassword(),
              CustomPrimaryButton(
                text: AppStrings.savePassword,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRouter.congratulations,
                  );
                },
              ),
            ],
          ).paddingSymmetric(
            verticalPadding: kTopPadding,
            horizontalPadding: kHorizontalPadding,
          ),
    );
  }
}

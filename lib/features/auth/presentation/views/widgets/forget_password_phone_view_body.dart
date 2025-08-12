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
import 'package:marketi/features/auth/presentation/views/widgets/form_field_forget_pass_phone.dart';

class ForgetPasswordPhoneViewBody extends StatelessWidget {
  const ForgetPasswordPhoneViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(
            spacing: 22,
            children: [
              AppBarForgetPassword(title: 'Forgot Password'),
              SizedBox.shrink(),
              SvgPicture.asset(
                Assets.imagesIllustrationForgotPasswordWithPhone,
              ),
              Text(
                'Please enter your phone number to receive a verification code.',
                textAlign: TextAlign.center,
                style: AppStyles().style16w500.copyWith(
                  color: AppColors.navyColor,
                ),
              ).paddingSymmetric(horizontalPadding: 34),
              FormFieldForgetPassPhone(),
              CustomPrimaryButton(
                text: AppStrings.sendCode,
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    AppRouter.verificationCode,
                  );
                },
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, AppRouter.forgotPasswordEmail);
                },
                child: Text(
                  'Try Another Way',
                  style: AppStyles().style16w600.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ).paddingSymmetric(
            horizontalPadding: kHorizontalPadding,
            verticalPadding: 13,
          ),
    );
  }
}

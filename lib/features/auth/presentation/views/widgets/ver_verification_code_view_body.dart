import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';
import 'package:marketi/features/auth/presentation/controller/reset_password_email_cubit/reset_password_email_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/app_bar_forget_password.dart';
import 'package:marketi/features/auth/presentation/views/widgets/custom_pin_code_field.dart';

class VerVerificationCodeViewBody extends StatefulWidget {
  const VerVerificationCodeViewBody({super.key, required this.emailOrPhone});

  final String emailOrPhone;

  @override
  State<VerVerificationCodeViewBody> createState() =>
      _VerVerificationCodeViewBodyState();
}

class _VerVerificationCodeViewBodyState
    extends State<VerVerificationCodeViewBody> {
  String verificationCode = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(
            spacing: 22,
            children: [
              AppBarForgetPassword(title: 'Verification Code'),
              SizedBox.shrink(),
              SvgPicture.asset(
                Assets.imagesIllustrationVerificationCodeWithPhone,
              ),
              Text(
                'Please enter the 4 digit code sent to: ${widget.emailOrPhone}',
                textAlign: TextAlign.center,
                style: AppStyles().style16w500.copyWith(
                  color: AppColors.navyColor,
                ),
              ).paddingSymmetric(horizontalPadding: 34),
              CustomPinCodeField(
                controller: TextEditingController(),
                onCompleted: (value) {
                  verificationCode = value;
                },
              ),
              CustomPrimaryButton(
                text: AppStrings.verifyCode,
                onPressed: () {
                  context.read<ResetPasswordEmailCubit>().verifyResetCode(
                    emailOrPhone: widget.emailOrPhone,
                    code: verificationCode,
                  );
                },
              ),
              Text(
                '00:46',
                textAlign: TextAlign.center,
                style: AppStyles().style16w600.copyWith(
                  color: AppColors.navyColor,
                ),
              ),
              Text(
                AppStrings.resendCode,
                textAlign: TextAlign.center,
                style: AppStyles().style16w600.copyWith(
                  color: AppColors.navyColor,
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

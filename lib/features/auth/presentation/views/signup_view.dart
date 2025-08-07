import 'package:flutter/material.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/auth/presentation/views/widgets/image_and_arrow_sign_up_widget.dart';
import 'package:marketi/features/auth/presentation/views/widgets/password_field.dart';
import 'package:marketi/features/auth/presentation/views/widgets/row_all_social_login_widget.dart';
import 'package:marketi/features/auth/presentation/views/widgets/title_text_sign_up.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SignupViewBody()));
  }
}

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageAndArrowSignUpWidget(),
          TitleTextSignUp(title: AppStrings.yourName),
          CustomTextFormField(
            hintText: AppStrings.fullName,
            textInputType: TextInputType.name,
          ),
          TitleTextSignUp(title: AppStrings.username),
          CustomTextFormField(
            prefixIcon: Icons.person_outline,
            hintText: AppStrings.username,
            textInputType: TextInputType.name,
          ),
          TitleTextSignUp(title: AppStrings.phoneNumber),
          CustomTextFormField(
            prefixIcon: Icons.phone,
            hintText: '+20 1501142409',
            textInputType: TextInputType.phone,
          ),
          TitleTextSignUp(title: AppStrings.email),
          CustomTextFormField(
            prefixIcon: Icons.email_outlined,
            hintText: 'You@gmail.com',
            textInputType: TextInputType.emailAddress,
          ),
          TitleTextSignUp(title: AppStrings.password),
          PasswordField(),
          TitleTextSignUp(title: AppStrings.confirmPassword),
          PasswordField(),
          SizedBox(height: 14),
          CustomPrimaryButton(text: AppStrings.signUp, onPressed: () {}),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Or Continue With',
              style: AppStyles().style12w400.copyWith(color: AppColors.navyColor),
            ).paddingOnly(top: 12, bottom: 18),

          ),
          RowAllSocialWidget().paddingOnly(
            bottom: 5,
          ),
        ],
      ),
    ).paddingSymmetric(
      horizontalPadding: kHorizontalPadding,
      verticalPadding: kTopPadding,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';
import 'package:marketi/core/widgets/custom_progress_hud.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/auth/data/models/sign_in.dart';
import 'package:marketi/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/are_you_new_register_widget.dart';
import 'package:marketi/features/auth/presentation/views/widgets/custom_button_skip.dart';
import 'package:marketi/features/auth/presentation/views/widgets/password_field.dart';
import 'package:marketi/features/auth/presentation/views/widgets/remember_me_and_forget_password.dart';
import 'package:marketi/features/auth/presentation/views/widgets/row_all_social_login_widget.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({
    super.key,
  });

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: kTopPadding),
            Row(children: [CustomButtonSkip()]),
            Image.asset(
              Assets.imagesLogoSplashScreen,
              fit: BoxFit.fill,
              width: 272,
              height: 232,
            ),
            SizedBox(height: 32),
            CustomTextFormField(
              prefixIcon: Icons.email_outlined,
              hintText: AppStrings.usernameOrEmail,
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {
                _email = value!.trim();
              },
            ),
            SizedBox(height: 14),
            PasswordField(
              onSaved: (value) {
                _password = value!.trim();
              },
            ),
            SizedBox(height: 6),
            const RememberMeAndForgetPassword(),
            SizedBox(height: 20),
            CustomPrimaryButton(text: AppStrings.login, onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                SignInModel signInModel = SignInModel(
                  email: _email,
                  password: _password,
                );
                context.read<AuthCubit>().signIn(signInModel);
              }
              else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            }),
            SizedBox(height: 14),
            Text(
              'Or Continue With',
              style: AppStyles().style12w400.copyWith(
                color: AppColors.navyColor,
              ),
            ),
            SizedBox(height: 14),
            RowAllSocialWidget(),
            SizedBox(height: 14),
            AreYouNewRegisterWidget(),
            SizedBox(height: 72),
          ],
        ).paddingSymmetric(horizontalPadding: kHorizontalPadding),
      ),
    );
  }
}

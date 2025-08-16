import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';
import 'package:marketi/core/widgets/custom_text_form_field.dart';
import 'package:marketi/features/auth/data/models/sign_up.dart';
import 'package:marketi/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/image_and_arrow_sign_up_widget.dart';
import 'package:marketi/features/auth/presentation/views/widgets/password_field.dart';
import 'package:marketi/features/auth/presentation/views/widgets/row_all_social_login_widget.dart';
import 'package:marketi/features/auth/presentation/views/widgets/title_text_sign_up.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
  String? _fullName;
  String? _userName;
  String? _phoneNumber;
  String? _email;
  String? _password;
  String? _confirmPassword;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageAndArrowSignUpWidget(),
            TitleTextSignUp(title: AppStrings.yourName),
            CustomTextFormField(
              hintText: AppStrings.fullName,
              textInputType: TextInputType.name,
              prefixIcon: Icons.person_outline,
              onSaved: (value) {
                _fullName = value!.trim();
              },
            ),
            TitleTextSignUp(title: AppStrings.username),
            CustomTextFormField(
              prefixIcon: Icons.person_outline,
              hintText: AppStrings.username,
              textInputType: TextInputType.name,
              onSaved: (value) {
                _userName = value!.trim();
              },
            ),
            TitleTextSignUp(title: AppStrings.phoneNumber),
            CustomTextFormField(
              prefixIcon: Icons.phone,
              hintText: '+20 1501142409',
              textInputType: TextInputType.phone,
              onSaved: (value) {
                _phoneNumber = value!.trim();
              },
            ),
            TitleTextSignUp(title: AppStrings.email),
            CustomTextFormField(
              prefixIcon: Icons.email_outlined,
              hintText: 'You@gmail.com',
              textInputType: TextInputType.emailAddress,
              onSaved: (value) {
                _email = value!.trim();
              },
            ),
            TitleTextSignUp(title: AppStrings.password),
            PasswordField(
              onSaved: (value) {
                _password = value!.trim();
              },
            ),
            TitleTextSignUp(title: AppStrings.confirmPassword),
            PasswordField(
              onSaved: (value) {
                _confirmPassword = value!.trim();
              },
            ),
            SizedBox(height: 14),
            CustomPrimaryButton(
              text: AppStrings.signUp,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  if (_password != _confirmPassword) {
                    showCustomToast(
                      message: "Passwords do not match",
                      type: ToastType.error,
                    );
                    return;
                  }
                  SignUpModel signUpModel = SignUpModel(
                    name: _fullName,
                    phone: _phoneNumber,
                    email: _email,
                    password: _password,
                    confirmPassword: _confirmPassword,
                  );
                  context.read<AuthCubit>().signUp(signUpModel);
                } else {
                  setState(() {
                    autovalidateMode = AutovalidateMode.always;
                  });
                }
              },
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Or Continue With',
                style: AppStyles().style12w400.copyWith(
                  color: AppColors.navyColor,
                ),
              ).paddingOnly(top: 12, bottom: 18),
            ),
            RowAllSocialWidget().paddingOnly(bottom: 5),
          ],
        ),
      ),
    );
  }
}

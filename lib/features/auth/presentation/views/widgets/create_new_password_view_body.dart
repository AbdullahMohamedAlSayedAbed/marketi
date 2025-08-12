import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';
import 'package:marketi/features/auth/data/models/update_password_model.dart';
import 'package:marketi/features/auth/presentation/controller/reset_password_email_cubit/reset_password_email_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/app_bar_forget_password.dart';
import 'package:marketi/features/auth/presentation/views/widgets/password_confirm_create_new_password.dart';

class CreateNewPasswordViewBody extends StatefulWidget {
  const CreateNewPasswordViewBody({super.key, required this.email});
  final String email;

  @override
  State<CreateNewPasswordViewBody> createState() =>
      _CreateNewPasswordViewBodyState();
}

class _CreateNewPasswordViewBodyState extends State<CreateNewPasswordViewBody> {
  String password = '';
  String confirmPassword = '';
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode? autovalidateMode;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
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
                PasswordConfirmCreateNewPassword(
                  onSavedPassword: (value) {
                    password = value!.trim();
                  },
                  onSavedPasswordConfirm: (newPass) {
                    confirmPassword = newPass!.trim();
                  },
                ),
                CustomPrimaryButton(
                  text: AppStrings.savePassword,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (password == confirmPassword) {
                        final UpdatePasswordModel updatePasswordModel =
                            UpdatePasswordModel(
                              email: widget.email,
                              password: password,
                              confirmPassword: confirmPassword,
                            );
                        context.read<ResetPasswordEmailCubit>().updatePassword(
                          updatePassword: updatePasswordModel,
                        );
                      } else {
                        showCustomToast(
                          message: 'Passwords do not match',
                          type: ToastType.error,
                        );
                      }
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                ),
              ],
            ).paddingSymmetric(
              verticalPadding: kTopPadding,
              horizontalPadding: kHorizontalPadding,
            ),
      ),
    );
  }
}

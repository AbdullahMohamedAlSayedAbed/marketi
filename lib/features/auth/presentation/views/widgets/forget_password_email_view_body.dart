import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';
import 'package:marketi/core/widgets/custom_progress_hud.dart';
import 'package:marketi/features/auth/presentation/controller/reset_password_email_cubit/reset_password_email_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/app_bar_forget_password.dart';
import 'package:marketi/features/auth/presentation/views/widgets/form_field_forget_pass_email.dart';

class ForgetPasswordEmailViewBodyBlocConsumer extends StatefulWidget {
  const ForgetPasswordEmailViewBodyBlocConsumer({super.key});

  @override
  State<ForgetPasswordEmailViewBodyBlocConsumer> createState() =>
      _ForgetPasswordEmailViewBodyBlocConsumerState();
}

class _ForgetPasswordEmailViewBodyBlocConsumerState
    extends State<ForgetPasswordEmailViewBodyBlocConsumer> {
  String email = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordEmailCubit, ResetPasswordEmailState>(
      listener: (context, state) {
        if (state is ResetPasswordEmailError) {
          showCustomToast(message: state.message, type: ToastType.error);
        } else if (state is ResetPasswordEmailSuccess) {
          showCustomToast(message: state.message, type: ToastType.success);
          context.pushReplacementNamed(
            AppRouter.verificationCodeEmail,
            arguments: email,
          );
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ResetPasswordEmailLoading,
          child: ForgetPasswordEmailViewBody(
            onSaved: (value) {
              email = value;
            },
          ),
        );
      },
    );
  }
}

class ForgetPasswordEmailViewBody extends StatefulWidget {
  const ForgetPasswordEmailViewBody({super.key, this.onSaved});
  final ValueChanged<String>? onSaved;
  @override
  State<ForgetPasswordEmailViewBody> createState() =>
      _ForgetPasswordEmailViewBodyState();
}

class _ForgetPasswordEmailViewBodyState
    extends State<ForgetPasswordEmailViewBody> {
  final _formKey = GlobalKey<FormState>();

  String? _email;
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
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
                AppBarForgetPassword(title: 'Forgot Password'),
                SizedBox.shrink(),
                SvgPicture.asset(
                  Assets.imagesIllustrationForgotPasswordWithEmail,
                ),
                Text(
                  'Please enter your email address to receive a verification code.',
                  textAlign: TextAlign.center,
                  style: AppStyles().style16w500.copyWith(
                    color: AppColors.navyColor,
                  ),
                ).paddingSymmetric(horizontalPadding: 34),
                FormFieldForgetPassEmail(
                  onSaved: (value) {
                    _email = value!.trim();
                    widget.onSaved!(value);
                  },
                ),
                CustomPrimaryButton(
                  text: AppStrings.sendCode,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      context
                          .read<ResetPasswordEmailCubit>()
                          .resetPasswordEmail(_email!);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                ),
              ],
            ).paddingSymmetric(
              horizontalPadding: kHorizontalPadding,
              verticalPadding: 13,
            ),
      ),
    );
  }
}

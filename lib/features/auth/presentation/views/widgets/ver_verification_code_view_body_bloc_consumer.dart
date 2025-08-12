import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/widgets/custom_progress_hud.dart';
import 'package:marketi/features/auth/presentation/controller/reset_password_email_cubit/reset_password_email_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/ver_verification_code_view_body.dart';

class VerVerificationCodeViewBodyBlocConsumer extends StatelessWidget {
  const VerVerificationCodeViewBodyBlocConsumer({
    super.key,
    required this.isPhone,
    required this.emailOrPhone,
  });
  final bool isPhone;
  final String emailOrPhone;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordEmailCubit, ResetPasswordEmailState>(
      listener: (context, state) {
        if (state is ResetPasswordEmailError) {
          showCustomToast(message: state.message, type: ToastType.error);
        } else if (state is ResetPasswordEmailSuccess) {
          showCustomToast(message: state.message, type: ToastType.success);
          context.pushReplacementNamed(AppRouter.createNewPassword,
              arguments: emailOrPhone);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ResetPasswordCodeLoading,
          child: VerVerificationCodeViewBody(emailOrPhone: emailOrPhone),
        );
      },
    );
  }
}

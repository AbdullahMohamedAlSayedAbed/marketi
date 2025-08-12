import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/widgets/custom_progress_hud.dart';
import 'package:marketi/features/auth/presentation/controller/reset_password_email_cubit/reset_password_email_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/create_new_password_view_body.dart';

class CreateNewPasswordViewBodyBlocConsumer extends StatelessWidget {
  const CreateNewPasswordViewBodyBlocConsumer({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordEmailCubit, ResetPasswordEmailState>(
      listener: (context, state) {
        if (state is ResetPasswordEmailError) {
          showCustomToast(message: state.message, type: ToastType.error);
        } else if (state is ResetPasswordEmailSuccess) {
          showCustomToast(message: state.message, type: ToastType.success);
          context.pushNamedAndRemoveUntil(AppRouter.congratulations);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is ResetPasswordEmailLoading,
          child: CreateNewPasswordViewBody(email: email),
        );
      },
    );
  }
}

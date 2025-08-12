
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/widgets/custom_progress_hud.dart';
import 'package:marketi/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/signup_view_body.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showCustomToast(message: state.message, type: ToastType.error);
        } else if (state is SignUpSuccess) {
          showCustomToast(
            message: "user created and verification email sent successfully",
            type: ToastType.success,
          );
          context.pushReplacementNamed(AppRouter.login);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AuthSignedUpLoading,
          child: SignupViewBody(),
        );
      },
    ).paddingSymmetric(
      horizontalPadding: kHorizontalPadding,
      verticalPadding: kTopPadding,
    );
  }
}

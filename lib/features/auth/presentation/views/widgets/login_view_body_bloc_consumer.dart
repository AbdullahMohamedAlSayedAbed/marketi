import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/widgets/custom_progress_hud.dart';
import 'package:marketi/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showCustomToast(message: state.message, type: ToastType.error);
        } else if (state is AuthSignedInSuccess) {
          showCustomToast(
            message: "Login Successfully",
            type: ToastType.success,
          );
          context.pushNamedAndRemoveUntil(AppRouter.home);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AuthSignedInLoading,
          child: LoginViewBody(),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/features/auth/presentation/controller/reset_password_email_cubit/reset_password_email_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/forget_password_email_view_body.dart';

class ForgotPasswordWithEmail extends StatelessWidget {
  const ForgotPasswordWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ResetPasswordEmailCubit>(),
        child: SafeArea(child: ForgetPasswordEmailViewBodyBlocConsumer()),
      ),
    );
  }
}

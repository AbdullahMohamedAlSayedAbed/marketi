import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/features/auth/presentation/controller/reset_password_email_cubit/reset_password_email_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/ver_verification_code_view_body_bloc_consumer.dart';

class VerificationCodeEmailView extends StatelessWidget {
  const VerificationCodeEmailView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ResetPasswordEmailCubit>(),
        child: SafeArea(
          child: VerVerificationCodeViewBodyBlocConsumer(
            isPhone: false,
            emailOrPhone: email,
          ),
        ),
      ),
    );
  }
}

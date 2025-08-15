import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/features/auth/presentation/controller/reset_password_email_cubit/reset_password_email_cubit.dart';
import 'package:marketi/features/auth/presentation/views/widgets/create_new_password_view_body_bloc_consumer.dart';

class CreateNewPasswordView extends StatelessWidget {
  const CreateNewPasswordView({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<ResetPasswordEmailCubit>(),
        child: SafeArea(
          child: CreateNewPasswordViewBodyBlocConsumer(email: email!),
        ),
      ),
    );
  }
}

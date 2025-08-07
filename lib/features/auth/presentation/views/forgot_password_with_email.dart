import 'package:flutter/material.dart';
import 'package:marketi/features/auth/presentation/views/widgets/forget_password_email_view_body.dart';

class ForgotPasswordWithEmail extends StatelessWidget {
  const ForgotPasswordWithEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ForgetPasswordEmailViewBody()),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:marketi/features/auth/presentation/views/widgets/ver_verification_code_view_body.dart';

class VerificationCodeEmailView extends StatelessWidget {
  const VerificationCodeEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: VerVerificationCodeViewBody(
          isPhone: false,
          emailOrPhone: 'example@example.com',
        ),
      ),
    );
  }
  }


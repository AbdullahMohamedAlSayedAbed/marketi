import 'package:flutter/material.dart';
import 'package:marketi/features/auth/presentation/views/widgets/ver_verification_code_view_body.dart';

class VerificationCodePhoneView extends StatelessWidget {
  const VerificationCodePhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: VerVerificationCodeViewBody(
          isPhone: true,
          emailOrPhone: '+20 1501142409 ',
        ),
      ),
    );
  }
}

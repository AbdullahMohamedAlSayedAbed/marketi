import 'package:flutter/material.dart';
import 'package:marketi/features/auth/presentation/views/widgets/forget_password_phone_view_body.dart';

class ForgetPasswordWithPhoneView extends StatelessWidget {
  const ForgetPasswordWithPhoneView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: const ForgetPasswordPhoneViewBody()));
  }
}

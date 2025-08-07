import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketi/features/auth/presentation/views/widgets/social_login_widget.dart';

class RowAllSocialWidget extends StatelessWidget {
  const RowAllSocialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SocialLoginWidget(icon: FontAwesomeIcons.google, onTap: () {}),
        SocialLoginWidget(icon: FontAwesomeIcons.facebook, onTap: () {}),
        SocialLoginWidget(icon: Icons.apple, onTap: () {}),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/features/auth/presentation/views/widgets/custom_button_skip.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: kTopPadding),
        Row(children: [CustomButtonSkip()]),
        Image.asset(Assets.imagesLogoSplashScreen,
        fit: BoxFit.fill,
        width: 272,
        height: 232,
        ),
      ],
    ).paddingSymmetric(horizontalPadding: kHorizontalPadding);
  }
}

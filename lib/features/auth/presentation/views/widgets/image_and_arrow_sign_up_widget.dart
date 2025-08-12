import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/features/auth/presentation/views/widgets/arrow_back_ios_widget.dart';

class ImageAndArrowSignUpWidget extends StatelessWidget {
  const ImageAndArrowSignUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArrowBackIosWidget(),
        const Spacer(),
        Image.asset(
          Assets.imagesLogoSplashScreen,
          fit: BoxFit.fill,
          width: 188,
          height: 160,
        ),
        const Spacer(),
      ],
    );
  }
}

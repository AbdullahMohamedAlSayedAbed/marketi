import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';

class ImageBrands extends StatelessWidget {
  const ImageBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.lightGreyColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Image.asset('assets/images/Town_Team_Brand_2.png'),
    );
  }
}

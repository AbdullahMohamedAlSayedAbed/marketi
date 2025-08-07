import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';

class ArrowBackIosWidget extends StatelessWidget {
  const ArrowBackIosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 48,
        height: 48,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.lightBlueColor),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Icon(Icons.arrow_back_ios, size: 18),
      ),
    );
  }
}

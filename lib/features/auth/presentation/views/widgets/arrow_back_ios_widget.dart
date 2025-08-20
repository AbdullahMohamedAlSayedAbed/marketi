import 'package:flutter/material.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';

class ArrowBackIosWidget extends StatelessWidget {
  const ArrowBackIosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.lightBlueColor),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Icon(Icons.arrow_back_ios, size: 22),
      ),
    );
  }
}

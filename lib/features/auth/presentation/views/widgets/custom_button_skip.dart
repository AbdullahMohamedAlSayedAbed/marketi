import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';

class CustomButtonSkip extends StatelessWidget {
  const CustomButtonSkip({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.lightBlueColor),
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Text(
          'Skip',
          style: TextStyle(
            color: const Color(0xFF3F80FF),
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

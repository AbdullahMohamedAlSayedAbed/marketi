import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';

class CustomDotIndicator extends StatelessWidget {
  const CustomDotIndicator({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: isActive ? 20 : 16,
      height: isActive ? 20 : 16,
      decoration: ShapeDecoration(
        color: !isActive
            ? AppColors.lightBlueColor
            : AppColors.darkPrimaryColor,
        shape: OvalBorder(),
      ),
    );
  }
}

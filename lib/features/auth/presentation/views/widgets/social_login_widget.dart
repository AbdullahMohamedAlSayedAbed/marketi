import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget({super.key, required this.icon, this.onTap});
  final IconData icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: AppColors.lightBlueColor),
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: Icon(icon, color: AppColors.darkPrimaryColor, size: 24),
      ),
    );
  }
}

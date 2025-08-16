import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';

class ProductTitle extends StatelessWidget {
  const ProductTitle({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles().style20w600.copyWith(
            color: AppColors.darkPrimaryColor,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            'View all',
            style: AppStyles().style16w500.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}

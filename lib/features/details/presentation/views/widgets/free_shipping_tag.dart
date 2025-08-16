import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';

class FreeShippingTag extends StatelessWidget {
  const FreeShippingTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "Free Shipping",
        style: AppStyles().style14w500.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}

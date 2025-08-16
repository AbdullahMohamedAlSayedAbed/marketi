import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor),
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
      ),
      alignment: Alignment.center,
      child: Text(
        "Add to Cart",
        style: AppStyles().style14w500.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}

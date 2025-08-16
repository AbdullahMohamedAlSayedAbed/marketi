import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';

class PriceText extends StatelessWidget {
  final String price;
  const PriceText({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Price\n$price",
      textAlign: TextAlign.center,
      style: AppStyles().style18w500.copyWith(
        color: AppColors.darkPrimaryColor,
      ),
    );
  }
}

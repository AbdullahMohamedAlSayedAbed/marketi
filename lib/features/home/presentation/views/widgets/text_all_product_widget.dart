import 'package:flutter/material.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';

class TextAllProductWidget extends StatelessWidget {
  const TextAllProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'All Products',
      style: AppStyles().style20w600.copyWith(
        color: AppColors.darkPrimaryColor,
      ),
    ).paddingSymmetric(verticalPadding: 14, horizontalPadding: 1);
  }
}

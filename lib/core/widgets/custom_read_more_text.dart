import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:readmore/readmore.dart';

class CustomReadMoreText extends StatelessWidget {
  const CustomReadMoreText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      text,
      trimMode: TrimMode.Line,
      trimLines: 2,
      style: AppStyles().style12w400.copyWith(
        color: AppColors.darkPrimaryColor,
      ),
      colorClickableText: AppColors.primaryColor,
      trimCollapsedText: 'see more',
      trimExpandedText: 'see less',
      moreStyle: AppStyles().style14w500.copyWith(
        color: AppColors.primaryColor,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';

class TitleTextSignUp extends StatelessWidget {
  const TitleTextSignUp({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppStyles().style12w500.copyWith(
        color: AppColors.darkPrimaryColor,
      ),
    );
  }
}

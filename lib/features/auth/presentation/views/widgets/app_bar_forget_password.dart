import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/features/auth/presentation/views/widgets/arrow_back_ios_widget.dart';

class AppBarForgetPassword extends StatelessWidget {
  const AppBarForgetPassword({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        ArrowBackIosWidget(),
        Text(
          title,
          style: AppStyles().style16w500.copyWith(color: AppColors.navyColor),
        ),
      ],
    );
  }
}

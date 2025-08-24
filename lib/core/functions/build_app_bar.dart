import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/image_profile_app_bar.dart';
import 'package:marketi/features/auth/presentation/views/widgets/arrow_back_ios_widget.dart';

AppBar buildAppBar({required String title}) {
  return AppBar(
    title: FadeInDown(
      duration: const Duration(milliseconds: 500),
      child: Text(
        title,
        style: AppStyles().style20w600.copyWith(
              color: AppColors.darkPrimaryColor,
            ),
      ),
    ),
    leading: FadeInLeft(
      duration: const Duration(milliseconds: 600),
      child: ArrowBackIosWidget().paddingOnly(left: 16),
    ),
    centerTitle: true,
    actions: [
      FadeInRight(
        duration: const Duration(milliseconds: 600),
        child: ImageProfileAppBar().paddingOnly(right: 8),
      ),
    ],
  );
}

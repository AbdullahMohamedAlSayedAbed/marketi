import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/app_strings.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';
import 'package:marketi/features/auth/presentation/views/widgets/arrow_back_ios_widget.dart';

class CongratulationsView extends StatelessWidget {
  const CongratulationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          SafeArea(
            child: Column(
              spacing: 22,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: ArrowBackIosWidget()),
                SizedBox.shrink(),
                SvgPicture.asset(Assets.imagesIllustrationCongratulations),
                Text(
                  'Congratulations',
                  textAlign: TextAlign.center,
                  style: AppStyles().style24w500.copyWith(
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
                Text(
                  'You have updated the password. please login again with your latest password',
                  textAlign: TextAlign.center,
                  style: AppStyles().style16w500.copyWith(
                    color: AppColors.navyColor,
                  ),
                ),
                CustomPrimaryButton(
                  text: AppStrings.login,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRouter.login);
                  },
                ),
              ],
            ).paddingSymmetric(
              verticalPadding: kTopPadding,
              horizontalPadding: kHorizontalPadding + 1,
            ),
          ),
    );
  }
}

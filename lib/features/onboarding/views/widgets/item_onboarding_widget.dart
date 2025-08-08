import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';
import 'package:marketi/features/onboarding/views/widgets/list_generate_dot_indicator.dart';

class ItemOnboardingWidget extends StatelessWidget {
  const ItemOnboardingWidget({super.key, required this.item, this.onPressed, required this.index});
  final ({String description, String image, String textBut, String title}) item;
  final void Function()? onPressed;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: SizedBox(height: 120)),
        SvgPicture.asset(item.image),
        SizedBox(height: 40),
        ListGenerateDotIndicator(
          length: 3,
          currentPage: index,
        ),
        SizedBox(height: 24),
        Text(
          item.title,
          style: AppStyles().style20w600.copyWith(
            color: AppColors.darkPrimaryColor,
          ),
        ),
        SizedBox(height: 44),
        Text(item.description, textAlign: TextAlign.center),
        Spacer(),
        CustomPrimaryButton(text: item.textBut, onPressed: onPressed),
        SizedBox(height: 14),
      ],
    ).paddingSymmetric(horizontalPadding: kHorizontalPadding);
  }
}

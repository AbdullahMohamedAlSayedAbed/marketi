import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/app_images.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 30,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.imagesIllustrationCartEmpty),
        Text(
          'Your Cart is Empty',
          textAlign: TextAlign.center,
          style: AppStyles().style24w500.copyWith(
            color: AppColors.darkPrimaryColor,
          ),
        ),
        Text(
          'Check our big offers, fresh products and fill your cart with items',
          textAlign: TextAlign.center,
          style: AppStyles().style16w500.copyWith(color: AppColors.navyColor),
        ),
        CustomPrimaryButton(text: "Start Shopping", onPressed: () {
          context.pushNamed(AppRouter.popularProductView);
        }),
      ],
    );
  }
}

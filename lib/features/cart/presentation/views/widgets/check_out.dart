import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_primary_button.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key, required this.itemsCount, required this.totalPrice, this.onPressed});
  final int itemsCount;
  final double totalPrice;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 14),
      elevation: 4,
      shadowColor: const Color(0x7FB2CCFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(width: 1, color: AppColors.lightBlueColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal ($itemsCount items)',
                  style: AppStyles().style14w600.copyWith(
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
                Text(
                  'EGP ${totalPrice.toStringAsFixed(2)}',
                  style: AppStyles().style14w600.copyWith(
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            CustomPrimaryButton(text: 'Checkout', onPressed: onPressed),
          ],
        ),
      ),
    );
  }
}

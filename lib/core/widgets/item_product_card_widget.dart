import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/favorite_product_item_widget.dart';
import 'package:marketi/features/home/presentation/views/home_view.dart';
import 'package:marketi/features/home/presentation/views/widgets/add_button_item_product.dart';

class ItemProductCardWidget extends StatelessWidget {
  const ItemProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 180,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(color: const Color(0xB2B2CCFF), blurRadius: 10)],
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.all(4),
                  height: 87,
                  decoration: BoxDecoration(
                    color: const Color(0xFFD9E6FF),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/Smart_Watch.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 5,
                  top: 8,
                  child: SizedBox(
                    width: 70.07,
                    child: Text(
                      '15% OFF',
                      textAlign: TextAlign.center,
                      style: AppStyles().style12w500.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
                Positioned(right: 10, top: 8, child: FavoriteProductItemWidget()),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 8,left: 8, top: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "499 LE",
                  style: AppStyles().style12w500.copyWith(
                    color: AppColors.darkPrimaryColor,
                  ),
                ),
                Row(
                  children: [
                    const Icon(Icons.star, size: 16),
                    const SizedBox(width: 2),
                    Text(
                      "4.9",
                      style: AppStyles().style12w500.copyWith(
                        color: AppColors.darkPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              "Smart Watch",
              style: AppStyles().style12w500.copyWith(
                color: AppColors.darkPrimaryColor,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: AddButtonItemProduct()),
            SizedBox(height: 6),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/features/details/presentation/views/widgets/add_to_cart_button.dart';
import 'package:marketi/features/details/presentation/views/widgets/free_shipping_tag.dart';
import 'package:marketi/features/details/presentation/views/widgets/price_text.dart';
import 'package:marketi/features/details/presentation/views/widgets/product_rating.dart';
import 'package:marketi/features/details/presentation/views/widgets/size_option.dart';
import 'package:marketi/features/home/data/models/all_product_model/product.dart';
import 'package:provider/provider.dart';

class ProductMoreDetails extends StatelessWidget {
  const ProductMoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var product = context.read<Product>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const FreeShippingTag(),
            ProductRating(
              rating: product.reviews![0].rating?.toDouble() ?? 0.0,
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          product.title ?? '',
          style: AppStyles().style18w500.copyWith(
            color: AppColors.darkPrimaryColor,
          ),
        ),
        const SizedBox(height: 8),

        Text(
          'Product Value',
          style: AppStyles().style16w400.copyWith(
            color: AppColors.darkPrimaryColor,
          ),
        ),
        const SizedBox(height: 8),

        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: product.description ?? '',
                style: TextStyle(fontSize: 12, color: Color(0xFF001640)),
              ),
              TextSpan(
                text: 'See more',
                style: AppStyles().style12w500.copyWith(
                  decoration: TextDecoration.underline,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),

        Text(
          'Select Size',
          style: AppStyles().style16w400.copyWith(
            color: AppColors.darkPrimaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          spacing: 12,
          children: const [
            SizeOption(size: "3", isSelected: false),

            SizeOption(size: "2", isSelected: true),

            SizeOption(size: "4", isSelected: false),
          ],
        ),
        const SizedBox(height: 24),

        /// Price + Add to Cart
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PriceText(price: "${product.price} EGP"),
            AddToCartButton(),
          ],
        ),
      ],
    );
  }
}

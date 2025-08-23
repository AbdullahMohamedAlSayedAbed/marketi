import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/favourite/presentation/views/widgets/favorite_product_item_widget.dart';
import 'package:marketi/features/home/data/models/all_product_model/product.dart';
import 'package:marketi/features/home/presentation/views/widgets/add_button_item_product.dart';

class ItemProductCardWidget extends StatelessWidget {
  const ItemProductCardWidget({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(AppRouter.details, arguments: product);
      },
      child: Container(
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
            Expanded(
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
                      child: CustomNetworkImage(
                        imageUrl: product.images?[0] ?? '',
                      ),
                    ),
                  ),
                  product.discountPercentage != null
                      ? Positioned(
                          left: 5,
                          top: 8,
                          child: Container(
                            margin: EdgeInsets.only(top: 2),
                            decoration: BoxDecoration(
                            color: AppColors.primaryColor.withAlpha(25),
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),),
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            width: 75,
                            child: Text(
                              '${product.discountPercentage}% OFF',
                              textAlign: TextAlign.center,
                              style: AppStyles().style12w500.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  Positioned(
                    right: 10,
                    top: 8,
                    child: FavoriteProductItemWidget(product: product),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8, top: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${product.price!.toStringAsFixed(1)} LE",
                    style: AppStyles().style12w500.copyWith(
                      color: AppColors.darkPrimaryColor,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 16),
                      const SizedBox(width: 2),
                      Text(
                        product.rating.toString(),
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
                product.title ?? '',
                style: AppStyles().style12w500.copyWith(
                  color: AppColors.darkPrimaryColor,
                ),
              ),
            ),
            Align(alignment: Alignment.center, child: AddButtonItemProduct(
              onTap: () {
                context.read<CartCubit>().addProduct(product);
              },
            )),
            SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}

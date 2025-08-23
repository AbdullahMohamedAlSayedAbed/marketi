import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/views/widgets/quantity_button.dart';

class ProductCart extends StatelessWidget {
  final CartItemModel cartItem;

  const ProductCart({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 190,
      child: Card(
        elevation: 3,

        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        shadowColor: const Color(0x7FB2CCFF),
        child: Padding(
          padding: const EdgeInsets.only(top: kTopPadding),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomNetworkImage(
                  imageUrl: cartItem.product.images?[0] ?? '',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            cartItem.product.title ?? 'No Title',
                            style: AppStyles().style14w600.copyWith(
                              color: AppColors.darkPrimaryColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Text(
                      cartItem.product.description ?? 'No Description',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF67687E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price: \$${cartItem.product.price}",
                          style: AppStyles().style14w600.copyWith(
                            color: AppColors.darkPrimaryColor,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              size: 16,
                              color: Colors.amber,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              cartItem.product.rating?.toString() ?? '0.0',
                              style: AppStyles().style12w500.copyWith(
                                color: AppColors.darkPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        QuantityButton(
                          icon: Icons.remove,
                          color: Colors.redAccent,
                          onTap: () {
                            context.read<CartCubit>().decreaseCount(
                              cartItem.product,
                            );
                          },
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF4FAFF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              cartItem.count.toString(),
                              style: AppStyles().style14w600.copyWith(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        QuantityButton(
                          icon: Icons.add,
                          color: Colors.blue,
                          onTap: () {
                            context.read<CartCubit>().addProduct(
                              cartItem.product,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

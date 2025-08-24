import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_error_widget.dart';
import 'package:marketi/features/cart/data/models/cart_model.dart';
import 'package:marketi/features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/cart/presentation/views/widgets/cart_empty.dart';
import 'package:marketi/features/cart/presentation/views/widgets/check_out.dart';
import 'package:marketi/features/cart/presentation/views/widgets/product_cart.dart';

class CartViewBody extends StatefulWidget {
  const CartViewBody({super.key});

  @override
  State<CartViewBody> createState() => _CartViewBodyState();
}

class _CartViewBodyState extends State<CartViewBody> {
  @override
  void initState() {
    context.read<CartCubit>().loadCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            'Products on Cart',
            style: AppStyles().style20w600.copyWith(
              color: AppColors.darkPrimaryColor,
            ),
          ).paddingOnly(top: kTopPadding),
        ),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is CartError) {
              return SliverFillRemaining(
                child: CustomErrorWidget(errorMessage: state.message),
              );
            } else if (state is CartLoaded) {
              CartModel cart = state.cart;
              if (cart.cartItems.isEmpty) {
                return const SliverFillRemaining(
                  child: Center(child: CartEmpty()),
                );
              }
              return SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final cartItem = cart.cartItems[index];
                  return ProductCart(cartItem: cartItem);
                }, childCount: cart.cartItems.length),
              );
            }
            return const SliverFillRemaining(child: SizedBox());
          },
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is CartLoaded) {
                return CheckOut(
                  itemsCount: state.cart.cartItems.length,
                  totalPrice: state.cart.calculateTotalPriceCart.toDouble(),
                  onPressed: () {
                    showCustomToast(
                      message: "Check out successfully",
                      type: ToastType.warning,
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}

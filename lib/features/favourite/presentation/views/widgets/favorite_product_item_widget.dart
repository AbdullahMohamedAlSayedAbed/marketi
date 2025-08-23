import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/features/favourite/presentation/controller/favorite_cubit/favorite_cubit.dart';
import 'package:marketi/features/home/data/models/all_product_model/product.dart';

class FavoriteProductItemWidget extends StatelessWidget {
  final Product product;
  const FavoriteProductItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        bool isFavorite = false;
        if (state is FavoriteLoaded) {
          isFavorite = state.favorites.list!.any((p) => p.id == product.id);
        }

        return IconButton(
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: AppColors.darkPrimaryColor,
          ),
          onPressed: () {
            if (isFavorite) {
              context.read<FavoriteCubit>().removeFavorite(product.id!);
            } else {
              context.read<FavoriteCubit>().addFavorite(product.id!);
            }
          },
        );
      },
    );
  }
}

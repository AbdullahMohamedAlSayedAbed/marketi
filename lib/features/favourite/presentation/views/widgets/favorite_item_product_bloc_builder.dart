import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_widget.dart';
import 'package:marketi/core/widgets/custom_shimmer_loading.dart';
import 'package:marketi/features/favourite/presentation/controller/favorite_cubit/favorite_cubit.dart';
import 'package:marketi/features/favourite/presentation/views/widgets/favorite_empty.dart';
import 'package:marketi/features/home/presentation/views/widgets/popular_product_grid_view_loading.dart';
import 'package:marketi/features/home/presentation/views/widgets/sliver_grid_item_product_widget.dart';

class FavoriteItemProductBlocBuilder extends StatelessWidget {
  const FavoriteItemProductBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteState>(
      builder: (context, state) {
        if (state is FavoriteLoaded) {
          if (state.favorites.list?.isEmpty ?? true) {
            return SliverToBoxAdapter(
              child:FavoriteEmpty(),
            );
          }
          return SliverGridItemProductWidget(allProductModel: state.favorites);
        } else if (state is FavoriteError) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.message),
          );
        }
        return SliverToBoxAdapter(
          child: CustomShimmerLoading(child: PopularProductGridViewLoading()),
        );
      },
    );
  }
}

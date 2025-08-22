import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_widget.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';
import 'package:marketi/features/home/presentation/views/widgets/sliver_grid_item_product_widget.dart';
import 'package:marketi/features/search/presentation/controller/cubit/search_cubit.dart';

class SearchBlocBuilder extends StatelessWidget {
  const SearchBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchError) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.message),
          );
        } else if (state is SearchSuccess) {
          final AllProductModel? products = state.products;
          if (products?.list?.isEmpty ?? true) {
            return SliverToBoxAdapter(
              child: CustomErrorWidget(errorMessage: 'No products found'),
            );
          }
          return SliverGridItemProductWidget(allProductModel: products!);
        } else if (state is SearchLoading) {
          return SliverToBoxAdapter(child: LinearProgressIndicator());
        } else {
          return SliverToBoxAdapter(
            child: Center(child: Text('Start typing to search products')),
          );
        }
      },
    );
  }
}

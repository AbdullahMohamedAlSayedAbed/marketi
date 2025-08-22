import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/widgets/custom_error_widget.dart';
import 'package:marketi/core/widgets/custom_search_field.dart';
import 'package:marketi/core/widgets/custom_shimmer_loading.dart';
import 'package:marketi/features/home/presentation/controllers/get_gategory_cubit/get_gategory_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/popular_product_grid_view_loading.dart';
import 'package:marketi/features/home/presentation/views/widgets/sliver_grid_item_product_widget.dart';
import 'package:marketi/features/home/presentation/views/widgets/text_all_product_widget.dart';

class ProductByCategoryViewBody extends StatelessWidget {
  const ProductByCategoryViewBody({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: CustomSearchField()),
              SliverToBoxAdapter(
                child: TextAllProductWidget(title: 'Products by $name'),
              ),
              BlocBuilder<GetGategoryCubit, GetGategoryState>(
                builder: (context, state) {
                  if (state is ProductByCategoriesError) {
                    return SliverToBoxAdapter(
                      child: CustomErrorWidget(errorMessage: state.message),
                    );
                  } else if (state is ProductByCategoriesSuccess) {
                    return SliverGridItemProductWidget(
                      allProductModel: state.products,
                    );
                  }
                  return SliverToBoxAdapter(
                    child: CustomShimmerLoading(
                      child: PopularProductGridViewLoading(),
                    ),
                  );
                },
              ),
            ],
          ).paddingSymmetric(
            horizontalPadding: kHorizontalPadding,
            verticalPadding: kTopPadding,
          ),
    );
  }
}

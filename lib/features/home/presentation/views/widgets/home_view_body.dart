import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/navigate_extension.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/utils/on_generate_router.dart';
import 'package:marketi/core/widgets/custom_error_widget.dart';
import 'package:marketi/core/widgets/custom_search_field.dart';
import 'package:marketi/features/home/presentation/controllers/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/brands_list_view.dart';
import 'package:marketi/features/home/presentation/views/widgets/carousel_slider_offer_home_widget.dart';
import 'package:marketi/features/home/presentation/views/widgets/category_item_bloc_builder.dart';
import 'package:marketi/features/home/presentation/views/widgets/list_view_separated_item_product.dart';
import 'package:marketi/features/home/presentation/views/widgets/product_title.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(
            spacing: 8,
            children: [
              CustomSearchField(onChanged: (p0) {}),
              CarouselSliderOfferHomeWidget(),
              BlocBuilder<GetAllProductCubit, GetAllProductState>(
                builder: (context, state) {
                  if (state is GetAllProductError) {
                    return CustomErrorWidget(errorMessage: state.message);
                  } else if (state is GetAllProductSuccess) {
                    if (state.allProductModel.list!.isEmpty) {
                      return Center(child: Text('No Product Available'));
                    }
                    return ListViewSeparatedItemProduct(
                      title: 'Popular Product',
                      onTap: () {
                        context.pushNamed(AppRouter.popularProductView);
                      },
                      allProductModel: state.allProductModel,
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              ProductTitle(title: 'Category',onTap: () {
                context.pushNamed(AppRouter.category);
              },),
              CategoryItemBlocBuilder(),
              BlocBuilder<GetAllProductCubit, GetAllProductState>(
                builder: (context, state) {
                  if (state is GetAllProductError) {
                    return CustomErrorWidget(errorMessage: state.message);
                  } else if (state is GetAllProductSuccess) {
                    if (state.allProductModel.list!.isEmpty) {
                      return Center(child: Text('No Product Available'));
                    }
                    return ListViewSeparatedItemProduct(
                      title: 'Best for You',
                      onTap: () {
                        context.pushNamed(AppRouter.popularProductView);
                      },
                      allProductModel: state.allProductModel,
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
              BrandsListView(),
              BlocBuilder<GetAllProductCubit, GetAllProductState>(
                builder: (context, state) {
                  if (state is GetAllProductError) {
                    return CustomErrorWidget(errorMessage: state.message);
                  } else if (state is GetAllProductSuccess) {
                    if (state.allProductModel.list!.isEmpty) {
                      return Center(child: Text('No Product Available'));
                    }
                    return ListViewSeparatedItemProduct(
                      title: 'Buy Again',
                      onTap: () {
                        context.pushNamed(AppRouter.popularProductView);
                      },
                      allProductModel: state.allProductModel,
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
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

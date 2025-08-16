import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/widgets/custom_error_widget.dart';
import 'package:marketi/core/widgets/custom_search_field.dart';
import 'package:marketi/features/home/presentation/controllers/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/sliver_grid_item_product_widget.dart';
import 'package:marketi/features/home/presentation/views/widgets/text_all_product_widget.dart';

class PopularProductViewBody extends StatelessWidget {
  const PopularProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: CustomSearchField(onChanged: (p0) {})),
              SliverToBoxAdapter(child: TextAllProductWidget()),
              BlocBuilder<GetAllProductCubit, GetAllProductState>(
                builder: (context, state) {
                  if (state is GetAllProductError) {
                    return SliverToBoxAdapter(
                      child: CustomErrorWidget(errorMessage: state.message),
                    );
                  }else if (state is GetAllProductSuccess) {
                  return SliverGridItemProductWidget(allProductModel: state.allProductModel);
                  }
                  return const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),));
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

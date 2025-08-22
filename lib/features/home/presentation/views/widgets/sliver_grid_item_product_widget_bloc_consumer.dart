import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/functions/show_custom_toast.dart';
import 'package:marketi/core/widgets/custom_error_widget.dart';
import 'package:marketi/core/widgets/custom_shimmer_loading.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';
import 'package:marketi/features/home/presentation/controllers/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/popular_product_grid_view_loading.dart';
import 'package:marketi/features/home/presentation/views/widgets/sliver_grid_item_product_widget.dart';

class SliverGridItemProductWidgetBlocConsumer extends StatefulWidget {
  const SliverGridItemProductWidgetBlocConsumer({super.key});

  @override
  State<SliverGridItemProductWidgetBlocConsumer> createState() =>
      _SliverGridItemProductWidgetBlocConsumerState();
}

class _SliverGridItemProductWidgetBlocConsumerState
    extends State<SliverGridItemProductWidgetBlocConsumer> {
  AllProductModel allProductModel = AllProductModel(list: []);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllProductCubit, GetAllProductState>(
      listener: (context, state) {
        if (state is GetAllProductSuccess) {
          allProductModel = state.allProductModel;
        }
        if (state is GetAllProductPaginationError) {
          showCustomToast(message: state.message, type: ToastType.error);
        }
      },
      builder: (context, state) {
        if (state is GetAllProductError) {
          return SliverToBoxAdapter(
            child: CustomErrorWidget(errorMessage: state.message),
          );
        } else if (state is GetAllProductSuccess ||
            state is GetAllProductPaginationLoading ||
            state is GetAllProductPaginationError) {
          return SliverGridItemProductWidget(allProductModel: allProductModel);
        } else if (state is GetAllProductLoading ||
            state is GetAllProductPaginationLoading) {
          return SliverToBoxAdapter(
            child: CustomShimmerLoading(child: PopularProductGridViewLoading()),
          );
        }
        return SliverToBoxAdapter(
          child: CustomShimmerLoading(child: PopularProductGridViewLoading()),
        );
      },
    );
  }
}

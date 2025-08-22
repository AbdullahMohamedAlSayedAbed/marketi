import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/widgets/custom_search_field.dart';
import 'package:marketi/features/home/presentation/controllers/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/sliver_grid_item_product_widget_bloc_consumer.dart';
import 'package:marketi/features/home/presentation/views/widgets/sort_bottom_sheet.dart';
import 'package:marketi/features/home/presentation/views/widgets/text_all_product_widget.dart';

class PopularProductViewBody extends StatefulWidget {
  const PopularProductViewBody({super.key});

  @override
  State<PopularProductViewBody> createState() => _PopularProductViewBodyState();
}

class _PopularProductViewBodyState extends State<PopularProductViewBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final cubit = context.read<GetAllProductCubit>();
    cubit.getAllProducts();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        cubit.getAllProducts();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await context.read<GetAllProductCubit>().getAllProducts(isRefresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child:
            CustomScrollView(
              controller: _scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: CustomSearchField(
                    onOrder: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (_) {
                          return BlocProvider.value(
                            value: context.read<GetAllProductCubit>(),
                            child: const SortBottomSheet(),
                          );
                        },
                      );
                    },
                  ),
                ),
                SliverToBoxAdapter(
                  child: TextAllProductWidget(title: 'All Products'),
                ),
                const SliverGridItemProductWidgetBlocConsumer(),
              ],
            ).paddingSymmetric(
              horizontalPadding: kHorizontalPadding,
              verticalPadding: kTopPadding,
            ),
      ),
    );
  }
}

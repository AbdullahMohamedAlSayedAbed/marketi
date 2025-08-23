import 'package:flutter/material.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/widgets/custom_search_field.dart';
import 'package:marketi/features/favourite/presentation/views/widgets/favorite_item_product_bloc_builder.dart';
import 'package:marketi/features/home/presentation/views/widgets/text_all_product_widget.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: CustomSearchField()),
        SliverToBoxAdapter(child: TextAllProductWidget(title: 'All Products')),
        FavoriteItemProductBlocBuilder(),
      ],
    ).paddingSymmetric(
      horizontalPadding: kHorizontalPadding,
      verticalPadding: kTopPadding,
    );
  }
}

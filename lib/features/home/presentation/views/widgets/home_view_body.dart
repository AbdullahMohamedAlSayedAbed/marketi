import 'package:flutter/material.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/widgets/custom_search_field.dart';
import 'package:marketi/features/home/presentation/views/widgets/brands_list_view.dart';
import 'package:marketi/features/home/presentation/views/widgets/carousel_slider_offer_home_widget.dart';
import 'package:marketi/features/home/presentation/views/widgets/category_item_widget.dart';
import 'package:marketi/features/home/presentation/views/widgets/list_view_separated_item_product.dart';
import 'package:marketi/features/home/presentation/views/widgets/product_title.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child:
            Column(
              spacing: 8,
              children: [
                CustomSearchField(onChanged: (p0) {}),
                CarouselSliderOfferHomeWidget(),
                ListViewSeparatedItemProduct(title: 'Popular Product'),
                ProductTitle(title: 'Category'),
                Wrap(
                  spacing: 16,
                  runSpacing: 8,
                  alignment: WrapAlignment.spaceBetween,
                  children: List.generate(6, (index) => CategoryItemWidget()),
                ),
                ListViewSeparatedItemProduct(title: 'Best for You'),
                BrandsListView(),
                ListViewSeparatedItemProduct(title: 'Buy Again'),
              ],
            ).paddingSymmetric(
              horizontalPadding: kHorizontalPadding,
              verticalPadding: kTopPadding,
            ),
      ),
    );
  }
}

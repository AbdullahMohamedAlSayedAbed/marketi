import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/item_product_card_widget.dart';
import 'package:marketi/features/home/data/models/dummy/all_product_dummy_data.dart';

class PopularProductGridViewLoading extends StatelessWidget {
  const PopularProductGridViewLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: allProductDummy.list!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 164 / 170,
        mainAxisSpacing: 8,
        crossAxisSpacing: 19,
      ),
      itemBuilder: (context, index) {
        return ItemProductCardWidget(product: allProductDummy.list![index]);
      },
    );
  }
}

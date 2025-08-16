import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/item_product_card_widget.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';

class SliverGridItemProductWidget extends StatelessWidget {
  const SliverGridItemProductWidget({
    super.key, this.allProductModel,
  });
final AllProductModel? allProductModel;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: allProductModel!.list!.length,
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount:2,
      childAspectRatio: 164/170,
      mainAxisSpacing: 8,
      crossAxisSpacing: 19
    ), itemBuilder: (context, index) {
      return ItemProductCardWidget(
        product: allProductModel!.list![index],
      );
    },);
  }
}

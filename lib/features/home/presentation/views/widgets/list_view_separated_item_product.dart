import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/item_product_card_widget.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';
import 'package:marketi/features/home/presentation/views/widgets/product_title.dart';

class ListViewSeparatedItemProduct extends StatelessWidget {
  const ListViewSeparatedItemProduct({super.key, required this.title, this.onTap, this.allProductModel});
  final String title;
  final void Function()? onTap;
  final AllProductModel? allProductModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        ProductTitle(title: title,onTap: onTap,),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ItemProductCardWidget(product: allProductModel!.list![index],);
            },
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: allProductModel!.list!.length,
          ),
        ),
      ],
    );
  }
}

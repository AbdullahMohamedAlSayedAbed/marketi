import 'package:flutter/material.dart';
import 'package:marketi/core/widgets/item_product_card_widget.dart';
import 'package:marketi/features/home/presentation/views/widgets/product_title.dart';

class ListViewSeparatedItemProduct extends StatelessWidget {
  const ListViewSeparatedItemProduct({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8,
      children: [
        ProductTitle(title: title),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ItemProductCardWidget();
            },
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: 9,
          ),
        ),
      ],
    );
  }
}

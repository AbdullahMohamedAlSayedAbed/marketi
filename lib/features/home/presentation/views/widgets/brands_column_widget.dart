import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/views/widgets/brands_list_view_bloc_builder.dart';
import 'package:marketi/features/home/presentation/views/widgets/product_title.dart';

class BrandsColumnWidget extends StatelessWidget {
  const BrandsColumnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        ProductTitle(title: 'Brands'),
        BrandsListViewBlocBuilder(),
      ],
    );
  }
}

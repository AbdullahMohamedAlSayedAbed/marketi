import 'package:flutter/material.dart';
import 'package:marketi/features/home/presentation/views/widgets/image_brands.dart';
import 'package:marketi/features/home/presentation/views/widgets/product_title.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductTitle(title: 'Brands'),
        SizedBox(
          height: 100,
          child: ListView.separated(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 16),
            itemBuilder: (context, index) {
              return ImageBrands();
            }
          ),
        ),
      ],
    );
  }
}

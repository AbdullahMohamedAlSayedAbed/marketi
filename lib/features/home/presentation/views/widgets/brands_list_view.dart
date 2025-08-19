import 'package:flutter/material.dart';
import 'package:marketi/features/home/data/models/brands_model.dart';
import 'package:marketi/features/home/presentation/views/widgets/image_brands.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({super.key, required this.brands});
  final List<BrandsModel> brands;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: brands.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => SizedBox(width: 16),
      itemBuilder: (context, index) {
        return ImageBrands(brand: brands[index]);
      },
    );
  }
}

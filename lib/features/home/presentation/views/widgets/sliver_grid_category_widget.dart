import 'package:flutter/material.dart';
import 'package:marketi/features/home/data/models/categories_model.dart';
import 'package:marketi/features/home/presentation/views/widgets/category_item_widget.dart';

class SliverGridCategoryWidget extends StatelessWidget {
  const SliverGridCategoryWidget({super.key, required this.categories});
  final List<CategoriesModel> categories;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 164 / 185,
        mainAxisSpacing: 14,
        crossAxisSpacing: 19,
      ),
      itemBuilder: (context, index) {
        return CategoryItemWidget(category: categories[index]);
      },
    );
  }
}

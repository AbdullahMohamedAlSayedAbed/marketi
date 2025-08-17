import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/core/widgets/custom_network_image.dart';
import 'package:marketi/features/home/data/models/categories_model.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, required this.category});
  final CategoriesModel category;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Column(
        children: [
          Container(
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1,
                  strokeAlign: BorderSide.strokeAlignOutside,
                  color: AppColors.lightGreyColor,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x0A3F80FF),
                  blurRadius: 4,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: CustomNetworkImage(imageUrl: category.image?? ''),
          ),
          Text(category.name?? '', style: AppStyles().style16w500.copyWith(
            color: AppColors.darkPrimaryColor
          ),maxLines: 1, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}

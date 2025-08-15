import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';
import 'package:marketi/features/home/data/models/brands_model.dart';

class ImageBrands extends StatelessWidget {
  const ImageBrands({super.key, required this.brand});
  final BrandsModel brand;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      constraints: const BoxConstraints(minWidth: 120, maxWidth: 150),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColors.lightGreyColor),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Text(brand.emoji ?? '',
            style: AppStyles().style32w500,
            textAlign: TextAlign.center,
          ),
          Text(brand.name ?? '',
            style: AppStyles().style16w600,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

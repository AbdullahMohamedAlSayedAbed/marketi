import 'package:flutter/material.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/core/utils/styles_app.dart';

class ProductRating extends StatelessWidget {
  final double rating;
  const ProductRating({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: List.generate(
            5,
            (index) =>  Icon(Icons.star, size: 18, color:index < rating.toInt() ? Colors.amber : AppColors.lightGreyColor),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          "($rating)",
          style:AppStyles().style12w500,
        ),
      ],
    );
  }
}

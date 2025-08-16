import 'package:flutter/material.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/features/details/presentation/views/widgets/page_view_details_product.dart';
import 'package:marketi/features/details/presentation/views/widgets/product_more_details.dart';

class DetailsProductViewBody extends StatelessWidget {
  const DetailsProductViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
          Column(
            spacing: 37,
            children: [PageViewDetailsProduct(), ProductMoreDetails()],
          ).paddingSymmetric(
            horizontalPadding: kHorizontalPadding,
            verticalPadding: kHorizontalPadding,
          ),
    );
  }
}

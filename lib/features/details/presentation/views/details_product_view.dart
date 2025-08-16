import 'package:flutter/material.dart';
import 'package:marketi/features/details/presentation/views/widgets/details_product_view_body.dart';
import 'package:marketi/features/home/data/models/all_product_model/product.dart';
import 'package:marketi/features/profile/presentation/views/widgets/custom_app_bar_profile_and_details.dart';
import 'package:provider/provider.dart';

class DetailsProductView extends StatelessWidget {
  const DetailsProductView({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBarProfileAndDetails(title: 'Product Details'),
      body: Provider.value(
        value: product,
        child: SafeArea(child: DetailsProductViewBody()),
      ),
    );
  }
}

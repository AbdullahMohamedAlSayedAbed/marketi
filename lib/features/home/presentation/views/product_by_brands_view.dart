import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/functions/build_app_bar.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/features/home/presentation/controllers/get_brands_cubit/get_brands_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/product_by_brands_view_body.dart';

class ProductByBrandsView extends StatelessWidget {
  const ProductByBrandsView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Products'),
      body: BlocProvider(
        create: (context) =>
            getIt<GetBrandsCubit>()..productByBrands(name: name),
        child: ProductByBrandsViewBody(name:name),
      ),
    );
  }
}

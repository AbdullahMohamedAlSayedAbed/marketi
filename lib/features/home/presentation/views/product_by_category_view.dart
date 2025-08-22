import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/functions/build_app_bar.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/features/home/presentation/controllers/get_gategory_cubit/get_gategory_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/product_by_category_view_body.dart';

class ProductByCategoryView extends StatelessWidget {
  const ProductByCategoryView({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Products'),
      body: BlocProvider(
        create: (context) =>
            getIt<GetGategoryCubit>()..productByCategories(name: name),
        child: ProductByCategoryViewBody(name:name),
      ),
    );
  }
}

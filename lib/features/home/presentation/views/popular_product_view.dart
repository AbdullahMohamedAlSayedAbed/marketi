import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/functions/build_app_bar.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/features/home/presentation/controllers/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/popular_product_view_body.dart';

class PopularProductView extends StatelessWidget {
  const PopularProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Popular Product'),
      body: BlocProvider(
        create: (context) => getIt<GetAllProductCubit>()..getAllProducts(),
        child: PopularProductViewBody(),
      ),
    );
  }
}

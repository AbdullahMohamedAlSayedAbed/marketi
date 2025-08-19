import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_widget.dart';
import 'package:marketi/core/widgets/custom_shimmer_loading.dart';
import 'package:marketi/features/home/data/models/dummy/brands_dummy.dart';
import 'package:marketi/features/home/presentation/controllers/get_brands_cubit/get_brands_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/brands_list_view.dart';

class BrandsListViewBlocBuilder extends StatelessWidget {
  const BrandsListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBrandsCubit, GetBrandsState>(
      builder: (context, state) {
        if (state is GetBrandsError) {
          return CustomErrorWidget(errorMessage: state.message);
        }
        if (state is GetBrandsSuccess) {
          if (state.brands.isEmpty) {
            return Center(child: Text('No Brands Available'));
          }
          return SizedBox(height: 100, child: BrandsListView(
            brands: state.brands,
          ));
        }
        return CustomShimmerLoading(child: SizedBox(
          height: 100,
          child: BrandsListView(brands: BrandsDummyList,)));
      },
    );
  }
}

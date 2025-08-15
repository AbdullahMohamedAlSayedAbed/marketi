import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_error_widget.dart';
import 'package:marketi/features/home/presentation/controllers/get_brands_cubit/get_brands_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/image_brands.dart';
import 'package:marketi/features/home/presentation/views/widgets/product_title.dart';

class BrandsListView extends StatelessWidget {
  const BrandsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      children: [
        ProductTitle(title: 'Brands'),
        BrandsListViewBlocBuilder(),
      ],
    );
  }
}

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
          return SizedBox(
            height: 100,
            child: ListView.separated(
              itemCount: state.brands.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 16),
              itemBuilder: (context, index) {
                return ImageBrands(brand: state.brands[index]);
              },
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}

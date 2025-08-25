import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/widgets/custom_shimmer_loading.dart';
import 'package:marketi/features/home/data/models/dummy/categories_dummy.dart';
import 'package:marketi/features/home/presentation/controllers/get_gategory_cubit/get_gategory_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/category_item_widget.dart';

class CategoryItemBlocBuilder extends StatelessWidget {
  const CategoryItemBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetGategoryCubit, GetGategoryState>(
      builder: (context, state) {
        if (state is GetGategoryError) {
          return Center(child: Text(state.message));
        }
        if (state is GetGategorySuccess) {
          return SizedBox(
            height: 350,
            child: GridView.builder(
              itemCount:state.categories.length ,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 122 / 105,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return CategoryItemWidget(category: state.categories[index]);
              },
            ),
          );
        }
        return CustomShimmerLoading(
          child: Wrap(
            spacing: 16,
            runSpacing: 8,
            alignment: WrapAlignment.spaceBetween,
            children: CategoriesDummyList.map(
              (e) => CategoryItemWidget(category: e),
            ).toList(),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return Wrap(
            spacing: 16,
            runSpacing: 8,
            alignment: WrapAlignment.spaceBetween,
            children: List.generate(6, (index) {
              return CategoryItemWidget(category: state.categories[index]);
            }),
          );
        }
        return Center(child: const CircularProgressIndicator());
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/presentation/controllers/get_all_product_cubit/get_all_product_cubit.dart';

class SortBottomSheet extends StatelessWidget {
  const SortBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.arrow_upward),
            title: const Text("Price: Low to High"),
            onTap: () {
              context.read<GetAllProductCubit>().getAllProducts(
                isRefresh: true,
                sortBy: "price",
                order: "asc",
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.arrow_downward),
            title: const Text("Price: High to Low"),
            onTap: () {
              context.read<GetAllProductCubit>().getAllProducts(
                isRefresh: true,
                sortBy: "price",
                order: "desc",
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.sort_by_alpha),
            title: const Text("Name: A → Z"),
            onTap: () {
              context.read<GetAllProductCubit>().getAllProducts(
                isRefresh: true,
                sortBy: "name",
                order: "asc",
              );
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.sort_by_alpha),
            title: const Text("Name: Z → A"),
            onTap: () {
              context.read<GetAllProductCubit>().getAllProducts(
                isRefresh: true,
                sortBy: "name",
                order: "desc",
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/presentation/controllers/get_all_product_cubit/get_all_product_cubit.dart';

class SortBottomSheet extends StatelessWidget {
  final String? currentSortBy;
  final String? currentOrder;

  const SortBottomSheet({
    super.key,
    this.currentSortBy,
    this.currentOrder,
  });

  @override
  Widget build(BuildContext context) {
    final options = [
      SortOption(
        icon: Icons.arrow_upward,
        title: "Price: Low to High",
        sortBy: "price",
        order: "asc",
      ),
      SortOption(
        icon: Icons.arrow_downward,
        title: "Price: High to Low",
        sortBy: "price",
        order: "desc",
      ),
      SortOption(
        icon: Icons.sort_by_alpha,
        title: "Name: A → Z",
        sortBy: "name",
        order: "asc",
      ),
      SortOption(
        icon: Icons.sort_by_alpha,
        title: "Name: Z → A",
        sortBy: "name",
        order: "desc",
      ),
    ];

    return SafeArea(
      child: FadeInUp(
        duration: const Duration(milliseconds: 400),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: options.map((option) {
            final isSelected = currentSortBy == option.sortBy &&
                currentOrder == option.order;

            return ListTile(
              leading: Icon(
                option.icon,
                color: isSelected ? Colors.blue : Colors.grey,
              ),
              title: Text(
                option.title,
                style: TextStyle(
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected ? Colors.blue : Colors.black,
                ),
              ),
              trailing: isSelected
                  ? const Icon(Icons.check, color: Colors.blue)
                  : null,
              onTap: () {
                context.read<GetAllProductCubit>().getAllProducts(
                      isRefresh: true,
                      sortBy: option.sortBy,
                      order: option.order,
                    );
                Navigator.pop(context);
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
class SortOption {
  final IconData icon;
  final String title;
  final String sortBy;
  final String order;

  SortOption({
    required this.icon,
    required this.title,
    required this.sortBy,
    required this.order,
  });
}
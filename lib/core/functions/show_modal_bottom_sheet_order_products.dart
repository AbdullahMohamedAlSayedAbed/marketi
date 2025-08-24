import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/features/home/presentation/controllers/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:marketi/features/home/presentation/views/widgets/sort_bottom_sheet.dart';

Future<dynamic> showModalBottomSheetOrderProducts(BuildContext context) {
    return showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  builder: (_) {
                    return BlocProvider.value(
                      value: context.read<GetAllProductCubit>(),
                      child: SortBottomSheet(
                        currentSortBy: context
                            .read<GetAllProductCubit>()
                            .sortBy,
                        currentOrder: context
                            .read<GetAllProductCubit>()
                            .order,
                      ),
                    );
                  },
                );
  }

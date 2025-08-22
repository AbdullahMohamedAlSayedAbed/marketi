import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/constant.dart';
import 'package:marketi/core/extension/padding_extension.dart';
import 'package:marketi/core/widgets/custom_search_field.dart';
import 'package:marketi/features/search/presentation/controller/cubit/search_cubit.dart';
import 'package:marketi/features/search/presentation/views/widgets/search_bloc_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: CustomSearchField(
            isSearch: true,
            onSubmitted: (search) {
              if (search.isEmpty) {
                return;
              }
              context.read<SearchCubit>().getSearch(query: search.trim());
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SearchBlocBuilder(),
      ],
    ).paddingSymmetric(
      horizontalPadding: kHorizontalPadding,
      verticalPadding: kTopPadding,
    );
  }
}

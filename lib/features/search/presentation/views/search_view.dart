import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/functions/build_app_bar.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/features/search/presentation/controller/cubit/search_cubit.dart';
import 'package:marketi/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Search'),
      body: BlocProvider(
        create: (context) => getIt<SearchCubit>(),
        child: SearchViewBody(),
      ),
    );
  }
}

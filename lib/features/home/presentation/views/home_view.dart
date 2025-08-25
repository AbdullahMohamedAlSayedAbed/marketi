import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/features/cart/presentation/controller/cart_cubit/cart_cubit.dart';
import 'package:marketi/features/favourite/presentation/controller/favorite_cubit/favorite_cubit.dart';
import 'package:marketi/features/home/presentation/controllers/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:marketi/features/home/presentation/controllers/get_brands_cubit/get_brands_cubit.dart';
import 'package:marketi/features/home/presentation/controllers/get_gategory_cubit/get_gategory_cubit.dart';
import 'package:marketi/features/home/presentation/views/bottom_navigation_bar_bloc_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<CartCubit>().loadCart();
    context.read<FavoriteCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<GetGategoryCubit>()..getCategories(),
        ),
        BlocProvider(create: (context) => getIt<GetBrandsCubit>()..getBrands()),
        BlocProvider(
          create: (context) => getIt<GetAllProductCubit>()..getAllProducts(),
        ),
      ],
      child: BottomNavigationBarBlocBuilder(),
    );
  }
}

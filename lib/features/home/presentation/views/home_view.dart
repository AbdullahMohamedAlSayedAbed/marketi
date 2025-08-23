import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/services/get_it_services.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/features/home/presentation/controllers/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';
import 'package:marketi/features/home/presentation/controllers/get_all_product_cubit/get_all_product_cubit.dart';
import 'package:marketi/features/home/presentation/controllers/get_brands_cubit/get_brands_cubit.dart';
import 'package:marketi/features/home/presentation/controllers/get_gategory_cubit/get_gategory_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BottomNavigationBarCubit>(context);
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
      child: BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
        builder: (context, state) {
          return Scaffold(
            appBar: cubit.appBars(context)[state.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.currentIndex,
              onTap: (index) {
                cubit.changeBottomNav(index);
              },
              items: buildBottomNavigation,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.navyColor,
              showUnselectedLabels: true,
            ),
            body: IndexedStack(
              index: state.currentIndex,
              children: cubit.screens,
            ),
          );
        },
      ),
    );
  }

  List<BottomNavigationBarItem> get buildBottomNavigation {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'Cart',
      ),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
      BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
    ];
  }
}

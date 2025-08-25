import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/utils/app_colors.dart';
import 'package:marketi/features/home/presentation/controllers/bottom_navigation_bar_cubit/bottom_navigation_bar_cubit.dart';

class BottomNavigationBarBlocBuilder extends StatelessWidget {
  const BottomNavigationBarBlocBuilder({super.key});
  List<BottomNavigationBarItem> get buildBottomNavigation {
    return const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(Icons.home_outlined),
        label: 'Home',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart_outlined),
        label: 'Cart',
        backgroundColor: Colors.white,
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favorites',
        backgroundColor: Colors.white,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<BottomNavigationBarCubit>(context);
    return BlocBuilder<BottomNavigationBarCubit, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          appBar: cubit.appBars(context)[state.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.currentIndex,
            type: BottomNavigationBarType.shifting,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: buildBottomNavigation,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: AppColors.navyColor,
            showUnselectedLabels: true,
            mouseCursor: WidgetStateMouseCursor.clickable,
          ),
          body: IndexedStack(
            index: state.currentIndex,
            children: cubit.screens,
          ),
        );
      },
    );
  }
}

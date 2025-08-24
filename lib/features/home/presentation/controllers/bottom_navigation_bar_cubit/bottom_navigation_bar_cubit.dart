import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketi/core/functions/build_app_bar.dart';
import 'package:marketi/features/cart/presentation/views/cart_view.dart';
import 'package:marketi/features/favourite/presentation/views/favourite_view.dart';
import 'package:marketi/features/home/presentation/views/helper/build_home_app_bar.dart';
import 'package:marketi/features/home/presentation/views/widgets/home_view_body.dart';

part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarCubit extends Cubit<BottomNavigationBarState> {
  BottomNavigationBarCubit() : super(BottomNavigationBarInitial());
  int currentIndex = 0;

  List<Widget> screens = [
    SafeArea(child: HomeViewBody()),
    CartView(),
    const FavoriteView(),
  ];
  List<AppBar> appBars(BuildContext context) => [
    buildHomeAppBar(context),
    buildAppBar(title: 'Cart'),
    buildAppBar(title: 'Favorites'),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(HomeShopChangeBottomNavState(currentIndex));
  }
}

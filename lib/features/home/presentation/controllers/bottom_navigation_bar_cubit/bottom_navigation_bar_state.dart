part of 'bottom_navigation_bar_cubit.dart';

sealed class BottomNavigationBarState extends Equatable {
  final int currentIndex;

  const BottomNavigationBarState(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

final class BottomNavigationBarInitial extends BottomNavigationBarState {
  const BottomNavigationBarInitial() : super(0);
}

final class HomeShopChangeBottomNavState extends BottomNavigationBarState {
  const HomeShopChangeBottomNavState(super.currentIndex);
}

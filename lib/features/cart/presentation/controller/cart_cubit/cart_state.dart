part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final CartModel cart;

  const CartLoaded(this.cart);

 
}

class CartError extends CartState {
  final String message;

  const CartError(this.message);


}

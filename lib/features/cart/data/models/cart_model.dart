import 'package:equatable/equatable.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';

class CartModel extends Equatable {
  final List<CartItemModel> cartItems;

  const CartModel({this.cartItems = const []});

  num get calculateTotalPriceCart =>
      cartItems.fold(0, (prev, e) => prev + e.calculateTotalPrice);

  @override
  List<Object?> get props => [cartItems];
}

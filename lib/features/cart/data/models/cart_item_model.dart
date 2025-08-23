import 'package:equatable/equatable.dart';
import 'package:marketi/features/home/data/models/all_product_model/product.dart';

class CartItemModel extends Equatable {
  final Product product;
  final int count;

  const CartItemModel({required this.product, this.count = 1});

  CartItemModel copyWith({int? count}) {
    return CartItemModel(product: product, count: count ?? this.count);
  }

  num get calculateTotalPrice => product.price! * count;

  @override
  List<Object?> get props => [product, count];
}

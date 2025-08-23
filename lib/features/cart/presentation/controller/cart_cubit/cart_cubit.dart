import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketi/features/cart/data/models/cart_item_model.dart';
import 'package:marketi/features/cart/data/models/cart_model.dart';
import 'package:marketi/features/cart/data/repos/cart_repos_impl.dart';
import 'package:marketi/features/home/data/models/all_product_model/product.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartReposImpl cartRepos;

  CartCubit({required this.cartRepos}) : super(CartInitial());

  CartModel cart = const CartModel();

  Future<void> loadCart() async {
    emit(CartLoading());
    final result = await cartRepos.getCart();

    result.fold(
      (error) {
        emit(CartError(error.errorModel.message));
      },
      (allProductModel) {
        final items =
            allProductModel.list
                ?.map((e) => CartItemModel(product: e, count: 1))
                .toList() ??
            [];
        cart = CartModel(cartItems: items);
        emit(CartLoaded(cart));
      },
    );
  }

  Future<void> addProduct(Product product) async {
    emit(CartLoading());
    final result = await cartRepos.addToCart(product.id!);

    result.fold((error) => emit(CartError(error.errorModel.message)), (
      message,
    ) {
      final items = List<CartItemModel>.from(cart.cartItems);
      final index = items.indexWhere((e) => e.product.id == product.id);

      if (index != -1) {
        items[index] = items[index].copyWith(count: items[index].count + 1);
      } else {
        items.add(CartItemModel(product: product, count: 1));
      }

      cart = CartModel(cartItems: items);
      emit(CartLoaded(cart));
    });
  }

  Future<void> removeProduct(Product product) async {
    emit(CartLoading());
    final result = await cartRepos.deleteFromCart(product.id!);

    result.fold((error) => emit(CartError(error.errorModel.message)), (
      message,
    ) {
      final items = List<CartItemModel>.from(cart.cartItems)
        ..removeWhere((e) => e.product.id == product.id);

      cart = CartModel(cartItems: items);
      emit(CartLoaded(cart));
    });
  }

  Future<void> decreaseCount(Product product) async {
    final items = List<CartItemModel>.from(cart.cartItems);
    final index = items.indexWhere((e) => e.product.id == product.id);

    if (index != -1) {
      final item = items[index];
      if (item.count > 1) {
        items[index] = item.copyWith(count: item.count - 1);
      } else {
        await removeProduct(product);
        return;
      }
    }

    cart = CartModel(cartItems: items);
    emit(CartLoaded(cart));
  }
}

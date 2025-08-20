part of 'get_gategory_cubit.dart';

sealed class GetGategoryState extends Equatable {
  const GetGategoryState();

  @override
  List<Object> get props => [];
}

final class GetGategoryInitial extends GetGategoryState {}

final class GetGategoryLoading extends GetGategoryState {}

final class GetGategorySuccess extends GetGategoryState {
  final List<CategoriesModel> categories;

  const GetGategorySuccess({required this.categories});

  @override
  List<Object> get props => [categories];
}

final class GetGategoryError extends GetGategoryState {
  final String message;

  const GetGategoryError({required this.message});

  @override
  List<Object> get props => [message];
}

final class ProductByCategoriesLoading extends GetGategoryState {}

final class ProductByCategoriesSuccess extends GetGategoryState {
  final AllProductModel? products;

  const ProductByCategoriesSuccess({ this.products});

  @override
  List<Object> get props => [products??[]];
}

final class ProductByCategoriesError extends GetGategoryState {
  final String message;

  const ProductByCategoriesError({required this.message});

  @override
  List<Object> get props => [message];
}

part of 'get_all_product_cubit.dart';

sealed class GetAllProductState extends Equatable {
  const GetAllProductState();

  @override
  List<Object> get props => [];
}

final class GetAllProductInitial extends GetAllProductState {}

final class GetAllProductLoading extends GetAllProductState {}

class GetAllProductPaginationLoading extends GetAllProductState {}

final class GetAllProductSuccess extends GetAllProductState {
  final AllProductModel allProductModel;

  const GetAllProductSuccess({required this.allProductModel});

  @override
  List<Object> get props => [allProductModel];
}

final class GetAllProductError extends GetAllProductState {
  final String message;

  const GetAllProductError({required this.message});

  @override
  List<Object> get props => [message];
}

final class GetAllProductPaginationError extends GetAllProductState {
  final String message;

  const GetAllProductPaginationError({required this.message});

  @override
  List<Object> get props => [message];
}

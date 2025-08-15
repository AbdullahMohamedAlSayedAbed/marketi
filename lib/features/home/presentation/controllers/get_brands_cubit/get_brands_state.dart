part of 'get_brands_cubit.dart';

sealed class GetBrandsState extends Equatable {
  const GetBrandsState();

  @override
  List<Object> get props => [];
}

final class GetBrandsInitial extends GetBrandsState {}

final class GetBrandsLoading extends GetBrandsState {}

final class GetBrandsSuccess extends GetBrandsState {
  final List<BrandsModel> brands;

  const GetBrandsSuccess({required this.brands});

  @override
  List<Object> get props => [brands];

}

final class GetBrandsError extends GetBrandsState {
  final String message;

  const GetBrandsError({required this.message});

  @override
  List<Object> get props => [message];
}

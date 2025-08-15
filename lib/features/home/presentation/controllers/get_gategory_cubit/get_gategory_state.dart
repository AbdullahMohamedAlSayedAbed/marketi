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

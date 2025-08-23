import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketi/features/favourite/data/repos/favourite_repo_impl.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepoImpl repo;
  FavoriteCubit(this.repo) : super(FavoriteInitial());

  Future<void> getFavorites() async {
    emit(FavoriteLoading());
    final result = await repo.getFavorite();
    result.fold(
      (error) => emit(FavoriteError(error.errorModel.message)),
      (favorites) => emit(FavoriteLoaded(favorites)),
    );
  }

  Future<void> addFavorite(int productId) async {
    emit(FavoriteLoading());
    final result = await repo.addFavorite(productId);
    result.fold(
      (error) => emit(FavoriteError(error.errorModel.message)),
      (message) async {
        await getFavorites(); 
      },
    );
  }

  Future<void> removeFavorite(int productId) async {
    emit(FavoriteLoading());
    final result = await repo.deleteFavorite(productId);
    result.fold(
      (error) => emit(FavoriteError(error.errorModel.message)),
      (message) async {
        await getFavorites(); 
      },
    );
  }
}

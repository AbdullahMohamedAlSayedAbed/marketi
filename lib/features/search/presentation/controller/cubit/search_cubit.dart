import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';
import 'package:marketi/features/search/data/repos/search_repo_impl.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitial());
  final SearchRepoImpl _searchRepo;
  Future<void> getSearch({required String query}) async {
    emit(SearchLoading());
    var result = await _searchRepo.searchProducts(query: query);
    result.fold(
      (error) => emit(SearchError(error.errorModel.message)),
      (products) => emit(SearchSuccess(products: products)),
    );
  }
}

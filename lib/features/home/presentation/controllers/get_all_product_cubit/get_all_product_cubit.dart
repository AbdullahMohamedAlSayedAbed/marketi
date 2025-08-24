import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';
import 'package:marketi/features/home/data/models/all_product_model/product.dart';
import 'package:marketi/features/home/data/repo/home_repo.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  final HomeRepo homeRepo;
  GetAllProductCubit(this.homeRepo) : super(GetAllProductInitial());

  final int _limit = 10;
  int _skip = 0;
  bool _isFetching = false;
  bool _hasMore = true;
  String? sortBy;
  String? order;
  final AllProductModel _allProducts = AllProductModel(list: []);

  Future<void> getAllProducts({
    bool isRefresh = false,
    String? sortBy,
    String? order,
  }) async {
    if (_isFetching) return;
    if (!_hasMore && !isRefresh) return;

    _isFetching = true;

    if (isRefresh) {
      _skip = 0;
      _hasMore = true;
      _allProducts.list?.clear();
      this.sortBy = sortBy ?? this.sortBy;
      this.order = order ?? this.order;
      emit(GetAllProductLoading());
    } else if (_allProducts.list?.isNotEmpty ?? false) {
      emit(GetAllProductPaginationLoading());
    } else {
      emit(GetAllProductLoading());
    }

    final result = await homeRepo.getAllProducts(
      skip: _skip,
      limit: _limit,
      sortBy: this.sortBy,
      order: this.order,
    );

    result.fold(
      (error) {
        if (_allProducts.list?.isEmpty ?? true) {
          emit(GetAllProductError(message: error.errorModel.message));
        } else {
          emit(GetAllProductPaginationError(message: error.errorModel.message));
        }
      },
      (allProducts) {
        final newProducts = allProducts.list ?? [];

        if (newProducts.isEmpty) {
          _hasMore = false;
        } else {
          _skip += _limit;
          _allProducts.list?.addAll(newProducts);
        }

        emit(
          GetAllProductSuccess(
            allProductModel: AllProductModel(
              list: List<Product>.from(_allProducts.list ?? []),
            ),
          ),
        );
      },
    );

    _isFetching = false;
  }
}

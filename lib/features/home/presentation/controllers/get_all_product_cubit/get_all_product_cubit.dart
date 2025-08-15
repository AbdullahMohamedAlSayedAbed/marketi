import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';
import 'package:marketi/features/home/data/repo/home_repo.dart';

part 'get_all_product_state.dart';

class GetAllProductCubit extends Cubit<GetAllProductState> {
  GetAllProductCubit(this.homeRepo) : super(GetAllProductInitial());
 final HomeRepo homeRepo;
  Future<void> getAllProducts() async {
    emit(GetAllProductLoading());
    var result = await homeRepo.getAllProducts();
    result.fold(
      (error) => emit(GetAllProductError(message: error.errorModel.message)),
      (allProducts) => emit(GetAllProductSuccess(allProductModel: allProducts)),
    );
  }
}

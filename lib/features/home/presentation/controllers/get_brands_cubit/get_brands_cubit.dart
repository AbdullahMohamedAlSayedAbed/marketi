import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketi/features/home/data/models/brands_model.dart';
import 'package:marketi/features/home/data/repo/home_repo.dart';

part 'get_brands_state.dart';

class GetBrandsCubit extends Cubit<GetBrandsState> {
  GetBrandsCubit(this.homeRepo) : super(GetBrandsInitial());
  final HomeRepo homeRepo;
  Future<void> getBrands() async {
    emit(GetBrandsLoading());
    var result = await homeRepo.getBrands();
    result.fold(
      (error) => emit(GetBrandsError(message: error.errorModel.message)),
      (brands) => emit(GetBrandsSuccess(brands: brands)),
    );
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketi/features/home/data/models/categories_model.dart';
import 'package:marketi/features/home/data/repo/home_repo.dart';

part 'get_gategory_state.dart';

class GetGategoryCubit extends Cubit<GetGategoryState> {
  GetGategoryCubit(this.homeRepo) : super(GetGategoryInitial());
final  HomeRepo homeRepo;
  Future<void> getCategories() async {
    emit(GetGategoryLoading());
    var result = await homeRepo.getCategories();
    result.fold(
      (error) => emit(GetGategoryError(message: error.errorModel.message)),
      (categories) => emit(GetGategorySuccess(categories: categories)),
    );
  }
}

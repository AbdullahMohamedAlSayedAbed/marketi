import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/core/api/dio_consumer.dart';
import 'package:marketi/features/auth/data/repo/auth_repo.dart';
import 'package:marketi/features/auth/data/repo/auth_repo_impl.dart';
import 'package:marketi/features/auth/presentation/controller/auth_cubit/auth_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() =>Dio());
  getIt.registerLazySingleton(() => DioConsumer(
    dio: getIt<Dio>(),
  ));
    getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(apiConsumer: getIt<DioConsumer>()),
  );
    getIt.registerFactory(
    () => AuthCubit(authRepo: getIt<AuthRepo>()),
  );
}

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:marketi/core/api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerLazySingleton(() =>Dio());
  getIt.registerLazySingleton(() => DioConsumer(
    dio: getIt<Dio>(),
  ));
}

import 'package:digital_boutique/core/cubits/app_cubit/app_cubit.dart';
import 'package:digital_boutique/core/networking/api_service.dart';
import 'package:digital_boutique/core/networking/dio_factory.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await _initCore();
}

/// Initializes the core functionality by creating an instance of Dio using DioFactory,
/// registers ApiService as a lazy singleton, and registers AppCubit as a factory.
Future<void> _initCore() async {
  
  final dio = DioFactory.getDio();

  getIt..registerLazySingleton(() => ApiService(dio))
  ..registerFactory(AppCubit.new);
}

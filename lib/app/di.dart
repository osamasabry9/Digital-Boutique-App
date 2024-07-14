import 'package:digital_boutique/core/cubits/app_cubit/app_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await _initCore();
}

Future<void> _initCore() async {
  // register cubit here if needed
  getIt.registerFactory(AppCubit.new);
}

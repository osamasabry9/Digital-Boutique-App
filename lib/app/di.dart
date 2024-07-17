import 'package:digital_boutique/core/cubits/app_cubit/app_cubit.dart';
import 'package:digital_boutique/core/networking/api_service.dart';
import 'package:digital_boutique/core/networking/dio_factory.dart';
import 'package:digital_boutique/features/auth/data/data_source/auth_data_source.dart';
import 'package:digital_boutique/features/auth/data/reposatory/auth_repos.dart';
import 'package:digital_boutique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await _initCore();
  await _initAuth();
}

/// Initializes the core functionality by creating an instance of Dio using DioFactory,
/// registers ApiService as a lazy singleton, and registers AppCubit as a factory.
Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();

  getIt
    ..registerLazySingleton(() => ApiService(dio))
    ..registerFactory(AppCubit.new)
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey);
}

Future<void> _initAuth() async {
  getIt
    ..registerFactory(() => AuthBloc(getIt<AuthRepos>()))
    ..registerLazySingleton(() => AuthRepos(getIt<AuthDataSource>()))
    ..registerLazySingleton(() => AuthDataSource(getIt<ApiService>()));
}

import 'package:digital_boutique/core/cubits/app_cubit/app_cubit.dart';
import 'package:digital_boutique/core/networking/api_service.dart';
import 'package:digital_boutique/core/networking/dio_factory.dart';
import 'package:digital_boutique/core/service/upload_image/cubit/upload_image_cubit.dart';
import 'package:digital_boutique/core/service/upload_image/data_source/upload_image_data_source.dart';
import 'package:digital_boutique/core/service/upload_image/repo/upload_image_repo.dart';
import 'package:digital_boutique/features/admin/add_categories/data/data_source/categories_admin_data_source.dart';
import 'package:digital_boutique/features/admin/add_categories/data/repos/categories_admin_repos.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/create_category/create_category_bloc.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/delete_category/delete_category_bloc.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/get_all_admin_categories/get_all_admin_categories_bloc.dart';
import 'package:digital_boutique/features/admin/add_categories/presentation/bloc/update_category/update_category_bloc.dart';
import 'package:digital_boutique/features/admin/add_notifications/data/data_source/add_notificaion_data_source.dart';
import 'package:digital_boutique/features/admin/add_notifications/data/repos/add_notification_repo.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/bloc/add_notification/add_notification_bloc.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/bloc/get_all_notification_admin/get_all_notification_admin_bloc.dart';
import 'package:digital_boutique/features/admin/add_notifications/presentation/bloc/send_notification/send_notification_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/data/data_source/products_admin_data_source.dart';
import 'package:digital_boutique/features/admin/add_products/data/repos/products_admin_repo.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/create_product/create_product_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/delete_product/delete_product_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/get_all_admin_products/get_all_admin_products_bloc.dart';
import 'package:digital_boutique/features/admin/add_products/presentation/bloc/update_product/update_product_bloc.dart';
import 'package:digital_boutique/features/admin/dashboard/data/data_source/dashboard_data_source.dart';
import 'package:digital_boutique/features/admin/dashboard/data/repos/dashboard_repo.dart';
import 'package:digital_boutique/features/admin/dashboard/presentation/bloc/categories_number/categories_number_bloc.dart';
import 'package:digital_boutique/features/admin/dashboard/presentation/bloc/products_number/products_number_bloc.dart';
import 'package:digital_boutique/features/admin/dashboard/presentation/bloc/users_number/users_number_bloc.dart';
import 'package:digital_boutique/features/admin/users/data/data_sources/users_data_source.dart';
import 'package:digital_boutique/features/admin/users/data/repos/users_repo.dart';
import 'package:digital_boutique/features/admin/users/presentation/bloc/delete_user/delete_user_bloc.dart';
import 'package:digital_boutique/features/admin/users/presentation/bloc/get_all_users/get_all_users_bloc.dart';
import 'package:digital_boutique/features/auth/data/data_source/auth_data_source.dart';
import 'package:digital_boutique/features/auth/data/reposatory/auth_repos.dart';
import 'package:digital_boutique/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:digital_boutique/features/customer/main/presentation/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  await _initCore();
  await _initAuth();
  await _initDashBoard();
  await _initCategoriesAdmin();
  await _initProductsAdmin();
  await _initUsersAdmin();
  await _initNotification();
  await _initMain();
}

/// Initializes the core functionality by creating an instance of Dio using DioFactory,
/// registers ApiService as a lazy singleton, and registers AppCubit as a factory.
Future<void> _initCore() async {
  final dio = DioFactory.getDio();
  final navigatorKey = GlobalKey<NavigatorState>();

  getIt
    ..registerLazySingleton(() => ApiService(dio))
    ..registerFactory(AppCubit.new)
    ..registerSingleton<GlobalKey<NavigatorState>>(navigatorKey)
    ..registerLazySingleton(() => UploadImageDataSource(getIt<ApiService>()))
    ..registerLazySingleton(
      () => UploadImageRepo(getIt<UploadImageDataSource>()),
    )
    ..registerFactory(() => UploadImageCubit(getIt<UploadImageRepo>()));
}

Future<void> _initAuth() async {
  getIt
    ..registerFactory(() => AuthBloc(getIt<AuthRepos>()))
    ..registerLazySingleton(() => AuthRepos(getIt<AuthDataSource>()))
    ..registerLazySingleton(() => AuthDataSource(getIt<ApiService>()));
}

Future<void> _initDashBoard() async {
  getIt
    ..registerFactory(() => CategoriesNumberBloc(getIt<DashBoardRepo>()))
    ..registerFactory(() => ProductsNumberBloc(getIt<DashBoardRepo>()))
    ..registerFactory(() => UsersNumberBloc(getIt<DashBoardRepo>()))
    ..registerLazySingleton(() => DashBoardRepo(getIt<DashBoardDataSource>()))
    ..registerLazySingleton(() => DashBoardDataSource(getIt<ApiService>()));
}

Future<void> _initCategoriesAdmin() async {
  getIt
    ..registerFactory(
      () => GetAllAdminCategoriesBloc(getIt<CategoriesAdminRepos>()),
    )
    ..registerFactory(
      () => CreateCategoryBloc(getIt<CategoriesAdminRepos>()),
    )
    ..registerFactory(
      () => DeleteCategoryBloc(getIt<CategoriesAdminRepos>()),
    )
    ..registerFactory(
      () => UpdateCategoryBloc(getIt<CategoriesAdminRepos>()),
    )
    ..registerLazySingleton(
      () => CategoriesAdminRepos(getIt<CategoriesAdminDataSource>()),
    )
    ..registerLazySingleton(
      () => CategoriesAdminDataSource(getIt<ApiService>()),
    );
}

Future<void> _initProductsAdmin() async {
  getIt
    ..registerFactory(
      () => GetAllAdminProductsBloc(getIt<ProductsAdminRepo>()),
    )
    ..registerFactory(
      () => CreateProductBloc(getIt<ProductsAdminRepo>()),
    )
    ..registerFactory(
      () => DeleteProductBloc(getIt<ProductsAdminRepo>()),
    )
    ..registerFactory(
      () => UpdateProductBloc(getIt<ProductsAdminRepo>()),
    )
    ..registerLazySingleton(
      () => ProductsAdminRepo(getIt<ProductsAdminDataSource>()),
    )
    ..registerLazySingleton(
      () => ProductsAdminDataSource(getIt<ApiService>()),
    );
}

Future<void> _initUsersAdmin() async {
  getIt
    ..registerFactory(
      () => GetAllUsersBloc(getIt<UsersRepo>()),
    )
    ..registerFactory(
      () => DeleteUserBloc(getIt<UsersRepo>()),
    )
    ..registerLazySingleton(
      () => UsersRepo(getIt<UserDataSource>()),
    )
    ..registerLazySingleton(
      () => UserDataSource(getIt<ApiService>()),
    );
}

Future<void> _initNotification() async {
  getIt
    ..registerFactory(
      AddNotificationBloc.new,
    )
    ..registerFactory(
      GetAllNotificationAdminBloc.new,
    )
    ..registerLazySingleton(AddNotificationDataSource.new)
    ..registerLazySingleton(
      () => AddNotificationRepo(
        addNotificationDataSource: getIt<AddNotificationDataSource>(),
      ),
    )
    ..registerFactory(() => SendNotificationBloc(getIt<AddNotificationRepo>()));
}

Future<void> _initMain() async {
  getIt.registerFactory(
    MainCubit.new,
  );
}

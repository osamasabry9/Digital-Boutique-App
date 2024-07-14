// ignore_for_file: lines_longer_than_80_chars
import 'package:digital_boutique/core/service/secure_storage/secure_storage_helper.dart';
import 'package:digital_boutique/core/service/shared_pref/pref_keys.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio getDio() {
    const timeOut = Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;

      debugPrint(
        '[USER Token] ====> ${SecureStorageHelper.getSecuredString(PrefKeys.accessToken)}',
      );

      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        request: false,
        compact: false,
      ),
    );
    dio?.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['Authorization'] =
              'Bearer ${SecureStorageHelper.getSecuredString(PrefKeys.accessToken)}';

          return handler.next(options);
        },
      ),
    );
  }
}

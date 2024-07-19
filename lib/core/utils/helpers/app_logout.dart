import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/local_storage/secure_storage/secure_storage_helper.dart';
import 'package:digital_boutique/core/local_storage/shared_pref/pref_keys.dart';
import 'package:digital_boutique/core/local_storage/shared_pref/shared_pref.dart';
import 'package:digital_boutique/core/routes/routes.dart';
import 'package:flutter/widgets.dart';

class AppLogout {
  factory AppLogout() {
    return _instance;
  }

  AppLogout._();

  static final AppLogout _instance = AppLogout._();

  Future<void> logout() async {
    final context = getIt<GlobalKey<NavigatorState>>().currentState!.context;
    await SecureStorageHelper.clearAllSecuredData();
    await SharedPref().removePreference(PrefKeys.accessToken);
    await SharedPref().removePreference(PrefKeys.userId);
    await SharedPref().removePreference(PrefKeys.userRole);
    if (!context.mounted) return;
    await context.pushNamedAndRemoveUntil(Routes.loginScreen);
  }
}

import 'package:digital_boutique/app/bloc_observer.dart';
import 'package:digital_boutique/app/di.dart';
import 'package:digital_boutique/app/digital_boutique_app.dart';
import 'package:digital_boutique/app/env.variables.dart';
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/service/secure_storage/secure_storage_helper.dart';
import 'package:digital_boutique/core/service/shared_pref/pref_keys.dart';
import 'package:digital_boutique/core/service/shared_pref/shared_pref.dart';
import 'package:digital_boutique/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // to initialize environment variables
  WidgetsFlutterBinding.ensureInitialized();

  // to initialize environment variables
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);

  // to initialize firebase app in the main function
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

// to initialize shared preference in the main function
  await SharedPref().instantiatePreferences();

// to initialize get it in the main function
  await setupGetIt();

// to initialize bloc observer to show the state changes in the app
  Bloc.observer = AppBlocObserver();

  await checkIfLoggedInUser();

/* 
   To allow the app to rotate to landscape mode when the device is
   in portrait mode and vice versa in the main function. 
*/
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  ).then((_) {
    // to run the app
    runApp(const DigitalBoutiqueApp());
  });
}

/// To check if user is logged in or not.
Future<void> checkIfLoggedInUser() async {
  String? userToken =
      await SecureStorageHelper.getSecuredString(PrefKeys.accessToken);
  if (!userToken.isNullOrEmpty()) {
    checkAdmin();
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}

void checkAdmin() {
  String? userRole = SharedPref().getString(PrefKeys.userRole);
  if (userRole == 'admin') {
    isAdmin = true;
  } else {
    isAdmin = false;
  }
}

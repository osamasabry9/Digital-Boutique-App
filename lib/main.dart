import 'package:digital_boutique/app/bloc_observer.dart';
import 'package:digital_boutique/app/digital_boutique_app.dart';
import 'package:digital_boutique/app/env.variables.dart';
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

// to initialize bloc observer to show the state changes in the app
  Bloc.observer = AppBlocObserver();
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

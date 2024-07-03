import 'package:digital_boutique/app/digital_boutique_app.dart';
import 'package:digital_boutique/app/env.variables.dart';
import 'package:digital_boutique/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // to initialize environment variables 
  WidgetsFlutterBinding.ensureInitialized();
  
  // to initialize environment variables
  await EnvVariable.instance.init(envType: EnvTypeEnum.dev);
  // to initialize firebase app in the main function
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // to run the app
  runApp(const DigitalBoutiqueApp());
}

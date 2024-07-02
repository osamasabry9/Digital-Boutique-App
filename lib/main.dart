import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/digital_boutique_app.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // to initialize firebase app in the main function
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const DigitalBoutiqueApp());
}

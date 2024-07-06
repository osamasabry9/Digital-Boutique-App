import 'package:digital_boutique/core/language/app_localizations.dart';
import 'package:digital_boutique/core/style/theme/color_extension.dart';
import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  // Color
  AppColors get theme => Theme.of(this).extension<AppColors>()!;
  
//Language
  String translate(String langKey) {
    return AppLocalizations.of(this)!.translate(langKey).toString();
  }

  // Navigator
  Future<dynamic> pushName(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this)
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.of(this)
        .pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pop() => Navigator.of(this).pop();
}

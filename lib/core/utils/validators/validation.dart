
import 'package:digital_boutique/core/extensions/context_extension.dart';
import 'package:digital_boutique/core/language/lang_keys.dart';
import 'package:flutter/material.dart';

class AppValidators {
  static String? validateEmail(String? value, {required BuildContext context}) {
    if (value == null || value.isEmpty) {
      return context.translate(LangKeys.validEmail);
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
       return context.translate(LangKeys.validEmail);
    }

    return null;
  }

  static String? validatePassword(String? value, {required BuildContext context}) {
    if (value == null || value.isEmpty) {
      return context.translate(LangKeys.validPassword);
    }

    // Check for minimum password length
    if (value.length < 6) {
      return context.translate(LangKeys.validPasswordLength);
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return context.translate(LangKeys.validPasswordUppercase);
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return context.translate(LangKeys.validPasswordNumber);
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return context.translate(LangKeys.validPasswordSpecial);
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10-digit US phone number format)
    final phoneRegExp = RegExp(r'^\d{10}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }

    return null;
  }

// Add more custom validators as needed for your specific requirements.
}

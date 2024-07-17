import 'package:digital_boutique/core/local_storage/shared_pref/pref_keys.dart';
import 'package:digital_boutique/core/local_storage/shared_pref/shared_pref.dart';


class FontFamilyHelper {
  const FontFamilyHelper._();

  static const String cairoArabic = 'Cairo';

  static const String poppinsEnglish = 'Poppins';

  static String getLocalizedFontFamily() {
    final currentLanguage = SharedPref().getString(PrefKeys.language);
    switch (currentLanguage) {
      case 'ar':
        return cairoArabic;
      case 'en':
        return poppinsEnglish;
      default:
        return poppinsEnglish;
    }
  }
}

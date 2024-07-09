class FontFamilyHelper {
  const FontFamilyHelper._();

  static const String cairoArabic = 'Cairo';

  static const String poppinsEnglish = 'Poppins';

  static String getLocalizedFontFamily() {
    //TODO: get current language from shared preferences

   final  currentLanguage = 'ar';
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

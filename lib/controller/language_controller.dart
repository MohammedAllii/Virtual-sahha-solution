import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends GetxController {
  // Private variable to store the current language code
  var _currentLanguageCode = 'en'.obs; // Default language is 'en'

  // Getter to access the current language code
  String get currentLanguage => _currentLanguageCode.value;

  // Load the saved language from shared preferences
  @override
  void onInit() {
    super.onInit();
    _loadLanguage();
  }

  // Load the saved language
  void _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String languageCode = prefs.getString('language') ?? 'en';
    _currentLanguageCode.value = languageCode;
    Get.updateLocale(Locale(languageCode)); // Update the app's locale
  }

  // Method to change the language
  void changeLanguage(String languageCode) async {
    _currentLanguageCode.value = languageCode; // Update the language code
    Locale newLocale = Locale(languageCode);
    Get.updateLocale(newLocale); // Update the app's locale

    // Save the selected language to shared preferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode);
  }
}

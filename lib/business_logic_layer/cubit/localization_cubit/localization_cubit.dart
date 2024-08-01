import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/helpers/shared_preferences.dart';
import 'package:home_slice/main.dart';
import 'package:intl/intl.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(super.initialLocale);

  void changeAppLanguage(Locale locale) async {
    emit(locale);
    await SharedPreferencesHelpers.saveAppLanguage(locale.languageCode);
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }

  String generateCountryFlag(String countryCode) {
    String flag = countryCode.toUpperCase().replaceAllMapped(
        RegExp(r'[A-Z]'),
        (Match match) =>
            String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
}

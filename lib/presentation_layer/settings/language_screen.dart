import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/constants/dimensions.dart';
import '../../core/widgets/appbar_widget.dart';
import 'widgets/arabic_language.dart';
import 'widgets/english_language.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    String language =
        context.locale.languageCode == 'en' ? 'English' : 'Arabic';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: context.tr('ChooseLanguage'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    context.setLocale(const Locale('en'));
                  },
                  child: EnglishLanguage(
                    language: language,
                  )),
              AppDimensions.verticalSpacing10,
              GestureDetector(
                  onTap: () {
                    context.setLocale(const Locale('ar'));
                  },
                  child: ArabicLanguage(
                    language: language,
                  )),
            ],
          ),
        ));
  }
}

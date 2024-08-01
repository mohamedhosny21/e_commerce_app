import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/localization_cubit/localization_cubit.dart';
import 'package:home_slice/constants/dimensions.dart';
import 'package:home_slice/generated/l10n.dart';
import 'package:home_slice/presentation_layer/settings/widgets/arabic_language.dart';
import 'package:home_slice/presentation_layer/settings/widgets/english_language.dart';

import '../../widgets/appbar_widget.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    final locale = context.watch<LocaleCubit>().state;
    String language = locale.languageCode == 'en' ? 'English' : 'Arabic';
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: S.of(context).ChooseLanguage,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    context
                        .read<LocaleCubit>()
                        .changeAppLanguage(const Locale('en'));
                  },
                  child: EnglishLanguage(
                    language: language,
                  )),
              AppDimensions.verticalSpacing10,
              GestureDetector(
                  onTap: () {
                    context
                        .read<LocaleCubit>()
                        .changeAppLanguage(const Locale('ar'));
                  },
                  child: ArabicLanguage(
                    language: language,
                  )),
            ],
          ),
        ));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../core/constants/styles.dart';

import '../../core/constants/colors.dart';
import '../../core/routing/routes.dart';
import '../../core/widgets/appbar_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(title: context.tr('Settings')),
        body: ListTile(
          leading: const Icon(Icons.language, color: MyColors.navyBlue),
          title: Text(
            context.tr('Language'),
            style: MyTextStyles.font16NavyBlueBold,
          ),
          onTap: () => Navigator.pushNamed(context, Routes.languageScreen),
        ));
  }
}

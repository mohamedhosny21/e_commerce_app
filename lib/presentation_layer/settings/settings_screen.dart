import 'package:flutter/material.dart';
import 'package:home_slice/constants/styles.dart';

import '../../constants/colors.dart';
import '../../generated/l10n.dart';
import '../../routing/routes.dart';
import '../../widgets/appbar_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: MyAppBar(
          title: S.of(context).Settings,
        ),
        body: ListTile(
          leading: const Icon(Icons.language, color: MyColors.navyBlue),
          title: Text(
            S.of(context).Language,
            style: MyTextStyles.font16NavyBlueBold,
          ),
          onTap: () => Navigator.pushNamed(context, Routes.languageScreen),
        ));
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/business_logic_layer/authentication_cubit/auth_cubit.dart';
import '../constants/colors.dart';
import '../routing/routes.dart';
import 'drawer_header.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
          height: 300.h,
          decoration: const BoxDecoration(color: MyColors.navyBlue),
          child: const DrawerHeaderWidget(),
        ),
        const SizedBox(
          height: 10,
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: Text(context.tr('Help')),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(context.tr('Settings')),
          onTap: () => Navigator.pushNamed(context, Routes.settingsScreen),
        ),
        ListTile(
          leading: const Icon(Icons.info),
          title: Text(context.tr('AboutUs')),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: Text(context.tr('Logout')),
          onTap: () {
            BlocProvider.of<AuthCubit>(context).signOut();
            //root navigator=true: Specifies that the root navigator should be used
            Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
                Routes.registerScreen, (route) => false);
          },
        ),
      ]),
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/business_logic_layer/authentication_cubit/auth_cubit.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';
import '../constants/dimensions.dart';
import '../constants/styles.dart';
import '../routing/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
          height: 300.h,
          decoration: const BoxDecoration(color: MyColors.navyBlue),
          child: DrawerHeader(
              child: FutureBuilder<SharedPreferences>(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                String userName = snapshot.data!.getString('name') ?? '';
                String userEmail = snapshot.data!.getString('email') ?? '';
                String userProfilePicture =
                    snapshot.data!.getString('profile_picture') ?? '';

                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 80.r,
                      backgroundColor: Colors.transparent,
                      backgroundImage: NetworkImage(userProfilePicture),
                    ),
                    AppDimensions.verticalSpacing15,
                    Text(
                      userName,
                      style: MyTextStyles.font20WhiteBold,
                    ),
                    AppDimensions.verticalSpacing15,
                    Text(userEmail, style: MyTextStyles.font14WhiteBold),
                  ],
                );
              } else {
                return const SizedBox();
              }
            },
          )),
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

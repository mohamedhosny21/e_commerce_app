import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/dimensions.dart';
import '../constants/styles.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
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
    ));
  }
}

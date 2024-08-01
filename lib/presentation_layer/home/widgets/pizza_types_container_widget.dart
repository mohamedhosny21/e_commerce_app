import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/constants/dimensions.dart';
import 'package:home_slice/constants/strings.dart';
import 'package:home_slice/constants/styles.dart';
import 'package:home_slice/routing/routes.dart';

import '../../../generated/l10n.dart';

class PizzaTypesContainer extends StatelessWidget {
  final Color color;
  final String image;
  final String category;
  const PizzaTypesContainer(
      {super.key,
      required this.color,
      required this.image,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppDimensions.paddingSymmetric8,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(30.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FadeInImage.assetNetwork(
            placeholder: AppConstants.loadingGif,
            image: image,
            width: 130.w,
          ),
          AppDimensions.verticalSpacing10,
          Text(
            category,
            style: MyTextStyles.font20NavyBlueBold,
            textAlign: TextAlign.center,
          ),
          AppDimensions.verticalSpacing10,
          Text(
            S.of(context).Pizza_Desc,
            style: MyTextStyles.font16GreyBold,
            textAlign: TextAlign.center,
          ),
          AppDimensions.verticalSpacing10,
          MaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.pizzaMenuScreen,
                  arguments: category);
            },
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.r)),
            child: Text(
              S.of(context).ShowNow,
              style: MyTextStyles.font14BlackBold,
            ),
          )
        ],
      ),
    );
  }
}

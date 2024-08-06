import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/styles.dart';
import '../../../core/routing/routes.dart';

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
            context.tr('Pizza_Desc'),
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
              context.tr('ShowNow'),
              style: MyTextStyles.font14BlackBold,
            ),
          )
        ],
      ),
    );
  }
}

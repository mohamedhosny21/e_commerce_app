import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/constants/strings.dart';
import 'package:home_slice/constants/styles.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/widgets/favorite_icon_container.dart';
import 'package:home_slice/routing/routes.dart';

import '../../../constants/dimensions.dart';

class PizzaWidget extends StatelessWidget {
  final PizzaModel pizzaModel;

  const PizzaWidget({
    super.key,
    required this.pizzaModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routes.pizzaOrderScreen,
                arguments: pizzaModel);
          },
          child: Card(
            elevation: 0.0,
            color: Colors.white,
            child: Container(
              padding: AppDimensions.paddingSymmetric10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  pizzaModel.image.isNotEmpty
                      ? Hero(
                          tag: pizzaModel.id,
                          child: FadeInImage.assetNetwork(
                            placeholder: AppConstants.loadingGif,
                            image: pizzaModel.image,
                            width: 130.w,
                            height: 130.h,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(),
                  AppDimensions.horizontalSpacing10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pizzaModel.pizzaName.toString(),
                          style: MyTextStyles.font16NavyBlueBold,
                        ),
                        AppDimensions.verticalSpacing10,
                        Text(
                          pizzaModel.menuDescription.toString(),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: MyTextStyles.font15GreyBold,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '\$${pizzaModel.originalPrice.toStringAsFixed(2)}',
                        overflow: TextOverflow.ellipsis,
                        style: MyTextStyles.font16BlackBold,
                      ),
                      AppDimensions.verticalSpacing65,
                      FavoriteIcon(
                          width: 50.w,
                          height: 50.h,
                          size: 30.sp,
                          pizzaModel: pizzaModel)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

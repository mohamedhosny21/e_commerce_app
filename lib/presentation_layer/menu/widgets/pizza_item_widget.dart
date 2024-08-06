import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/constants/styles.dart';
import '../../../core/routing/routes.dart';
import '../../../core/widgets/favorite_icon_container.dart';
import '../../../data_layer/models/pizza_model.dart';
import 'pizza_menu_item_image.dart';
import 'pizza_menu_item_name_with_desc.dart';

import '../../../core/constants/dimensions.dart';

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
                      ? PizzaMenuItemImage(pizzaModel: pizzaModel)
                      : const SizedBox(),
                  AppDimensions.horizontalSpacing10,
                  PizzaMenuItemNameWithDescription(pizzaModel: pizzaModel),
                  Column(
                    children: [
                      _buildPizzaMenuItemPrice(),
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

  Text _buildPizzaMenuItemPrice() {
    return Text(
      '\$${pizzaModel.originalPrice.toStringAsFixed(2)}',
      overflow: TextOverflow.ellipsis,
      style: MyTextStyles.font16BlackBold,
    );
  }
}

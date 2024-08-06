import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/business_logic_layer/cart_cubit/cubit/cart_cubit.dart';
import '../../../business_logic_layer/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';
import '../../../core/constants/styles.dart';
import '../../../data_layer/models/pizza_model.dart';

class AddToCartButton extends StatelessWidget {
  final PizzaModel pizzaModel;
  const AddToCartButton({
    super.key,
    required this.pizzaModel,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
      builder: (context, state) {
        return Padding(
          padding: AppDimensions.paddingFromSTEB_30_0_30_20,
          child: BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              final CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
              final isAddedToCart = cartCubit.cartPizzaItems
                  .where((element) => element.pizzaSize == pizzaModel.pizzaSize)
                  .any((element) => pizzaModel.id == element.id);

              return MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.r)),
                onPressed: () {
                  if (isAddedToCart) {
                    BlocProvider.of<CartCubit>(context)
                        .deleteFromCartDatabase(pizzaModel);
                  } else {
                    BlocProvider.of<CartCubit>(context)
                        .insertIntoCartDatabase(pizzaModel);
                  }
                },
                color: MyColors.navyBlue,
                textColor: Colors.white,
                height: 50.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isAddedToCart
                          ? context.tr('RemoveFromCart')
                          : context.tr('AddToCart'),
                      style: MyTextStyles.font20WhiteBold,
                    ),
                    AppDimensions.horizontalSpacing10,
                    Icon(
                      isAddedToCart
                          ? Icons.remove_shopping_cart_rounded
                          : Icons.add_shopping_cart_rounded,
                      color: Colors.white,
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

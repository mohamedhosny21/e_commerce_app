import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/presentation_layer/orders/widgets/pizza_size_container.dart';
import '../../../business_logic_layer/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../../core/constants/colors.dart';
import '../../../core/constants/dimensions.dart';

typedef GetPizzaSize = void Function(int pizzaSizeIndex, String pizzaSize);

class PizzaSizeContainers extends StatelessWidget {
  final PizzaModel pizzaModel;
  int pizzaSizeIndex;
  final GetPizzaSize getPizzaSize;
  final PizzaOrderCubit pizzaOrderCubit;
  String pizzaSize;
  PizzaSizeContainers(
      {super.key,
      required this.pizzaModel,
      required this.pizzaSizeIndex,
      required this.getPizzaSize,
      required this.pizzaOrderCubit,
      required this.pizzaSize});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PizzaOrderCubit, PizzaOrderState>(
      builder: (consize, state) {
        return Row(
          children: [
            Expanded(
                child: PizzaSizeContainer(
              color: pizzaSizeIndex == 1 ? MyColors.pink : Colors.white,
              size: context.tr('small'),
              ontap: () {
                if (pizzaSizeIndex != 1) {
                  pizzaSizeIndex = 1;
                  pizzaSize = context.tr('small');
                  getPizzaSize(pizzaSizeIndex, pizzaSize);
                }
              },
            )),
            AppDimensions.horizontalSpacing10,
            Expanded(
                child: PizzaSizeContainer(
              color: pizzaSizeIndex == 2 ? MyColors.pink : Colors.white,
              size: context.tr('medium'),
              ontap: () {
                if (pizzaSizeIndex != 2) {
                  pizzaSizeIndex = 2;
                  pizzaSize = context.tr('medium');
                  getPizzaSize(pizzaSizeIndex, pizzaSize);
                }
              },
            )),
            AppDimensions.horizontalSpacing10,
            Expanded(
                child: PizzaSizeContainer(
              color: pizzaSizeIndex == 3 ? MyColors.pink : Colors.white,
              size: context.tr('large'),
              ontap: () {
                if (pizzaSizeIndex != 3) {
                  pizzaSizeIndex = 3;
                  pizzaSize = context.tr('large');
                  getPizzaSize(pizzaSizeIndex, pizzaSize);
                }
              },
            )),
          ],
        );
      },
    );
  }
}

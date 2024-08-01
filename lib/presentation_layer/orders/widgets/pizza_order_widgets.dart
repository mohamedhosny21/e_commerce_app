import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/constants/dimensions.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import 'package:home_slice/generated/l10n.dart';
import 'package:home_slice/presentation_layer/orders/widgets/pizza_size_container.dart';

import '../../../business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../../constants/colors.dart';

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
              size: S.of(context).small,
              ontap: () {
                if (pizzaSizeIndex != 1) {
                  pizzaSizeIndex = 1;
                  pizzaSize = S.of(context).small;
                  getPizzaSize(pizzaSizeIndex, pizzaSize);
                }
              },
            )),
            AppDimensions.horizontalSpacing10,
            Expanded(
                child: PizzaSizeContainer(
              color: pizzaSizeIndex == 2 ? MyColors.pink : Colors.white,
              size: S.of(context).medium,
              ontap: () {
                if (pizzaSizeIndex != 2) {
                  pizzaSizeIndex = 2;
                  pizzaSize = S.of(context).medium;
                  getPizzaSize(pizzaSizeIndex, pizzaSize);
                }
              },
            )),
            AppDimensions.horizontalSpacing10,
            Expanded(
                child: PizzaSizeContainer(
              color: pizzaSizeIndex == 3 ? MyColors.pink : Colors.white,
              size: S.of(context).large,
              ontap: () {
                if (pizzaSizeIndex != 3) {
                  pizzaSizeIndex = 3;
                  pizzaSize = S.of(context).large;
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

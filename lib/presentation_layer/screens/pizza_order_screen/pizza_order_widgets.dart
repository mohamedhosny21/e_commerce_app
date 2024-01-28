import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/constants/dimensions.dart';
import 'package:home_slice/constants/styles.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';

import '../../../business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../../constants/colors.dart';

Widget buildPizzaSizeContainer(
    {required Color color, required String text, required VoidCallback ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      padding: AppDimensions.paddingSymmetric6,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.grey.shade400)),
      child: Text(
        text,
        style: MyTextStyles.font14BlackBold,
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Row buildDeliveryTimeRow() {
  return Row(
    children: [
      const Text('Delivery Time'),
      AppDimensions.horizontalSpacing10,
      const Icon(
        Icons.alarm,
        color: Colors.purple,
      ),
      AppDimensions.horizontalSpacing5,
      const Text('15 min'),
    ],
  );
}

typedef GetPizzaSize = void Function(int pizzaSizeIndex, String pizzaSize);

// ignore: must_be_immutable
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
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
                child: buildPizzaSizeContainer(
              color: pizzaSizeIndex == 1 ? MyColors.pink : Colors.white,
              text: 'Small',
              ontap: () {
                if (pizzaSizeIndex != 1) {
                  pizzaSizeIndex = 1;
                  pizzaSize = 'Small';
                  getPizzaSize(pizzaSizeIndex, pizzaSize);
                }
              },
            )),
            AppDimensions.horizontalSpacing10,
            Expanded(
                child: buildPizzaSizeContainer(
              color: pizzaSizeIndex == 2 ? MyColors.pink : Colors.white,
              text: 'Medium',
              ontap: () {
                if (pizzaSizeIndex != 2) {
                  pizzaSizeIndex = 2;
                  pizzaSize = 'Medium';
                  getPizzaSize(pizzaSizeIndex, pizzaSize);
                }
              },
            )),
            AppDimensions.horizontalSpacing10,
            Expanded(
                child: buildPizzaSizeContainer(
              color: pizzaSizeIndex == 3 ? MyColors.pink : Colors.white,
              text: 'Large',
              ontap: () {
                if (pizzaSizeIndex != 3) {
                  pizzaSizeIndex = 3;
                  pizzaSize = 'Large';
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

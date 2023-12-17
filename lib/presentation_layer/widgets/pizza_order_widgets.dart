import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/constants/dimensions.dart';
import 'package:home_slice/data_layer/models/pizza_model.dart';
import '../../business_logic_layer/cubit/pizza_order_cubit/cubit/pizza_order_cubit.dart';
import '../../constants/colors.dart';

Widget buildPizzaSizeContainer(
    {required Color color, required String text, required VoidCallback ontap}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      padding: const EdgeInsetsDirectional.all(8),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade400)),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    ),
  );
}

Widget buildAddAndRemoveContainer({
  required VoidCallback onPressed,
  required IconData icon,
  required Color color,
}) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade400)),
    child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 20,
        )),
  );
}

Row buildDeliveryTimeRow() {
  return const Row(
    children: [
      Text('Delivery Time'),
      AppDimensions.horizontalSpacingDefault,
      Icon(
        Icons.alarm,
        color: Colors.purple,
      ),
      AppDimensions.horizontalSpacingS,
      Text('15 min'),
    ],
  );
}

typedef GetPizzaSize = void Function(int pizzaSizeIndex, String pizzaSize);

// ignore: must_be_immutable
class BuildAllPizzaSizeContainers extends StatelessWidget {
  final PizzaModel pizzaModel;
  int pizzaSizeIndex;
  final GetPizzaSize getPizzaSize;
  final PizzaOrderCubit pizzaOrderCubit;
  String pizzaSize;
  BuildAllPizzaSizeContainers(
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
            AppDimensions.horizontalSpacingDefault,
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
            AppDimensions.horizontalSpacingDefault,
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

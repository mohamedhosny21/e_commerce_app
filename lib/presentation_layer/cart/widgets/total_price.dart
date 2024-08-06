import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic_layer/cart_cubit/cubit/cart_cubit.dart';
import '../../../core/constants/styles.dart';

class TotalPrice extends StatelessWidget {
  const TotalPrice({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ListTile(
        title: Text(
          '${context.tr('TotalPrice')} :',
          style: MyTextStyles.font18NavyBlueBold,
        ),
        trailing: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            context.read<CartCubit>().getPaymentPrice();
            return Text(
              '\$ ${context.read<CartCubit>().totalPrice.toStringAsFixed(2)}',
              style: MyTextStyles.font18NavyBlueBold,
            );
          },
        ),
      ),
    );
  }
}

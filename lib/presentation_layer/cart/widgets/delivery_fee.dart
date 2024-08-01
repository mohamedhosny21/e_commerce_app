import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/generated/l10n.dart';

import '../../../business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import '../../../constants/styles.dart';

class DeliveryFee extends StatelessWidget {
  const DeliveryFee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListTile(
        title: Text(
          '${S.of(context).DeliveryFee} :',
          style: MyTextStyles.font18NavyBlueBold,
        ),
        trailing: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Text(
              '\$ ${context.read<CartCubit>().deliveryFee + context.read<CartCubit>().deliveryFee}',
              style: MyTextStyles.font18NavyBlueBold,
            );
          },
        ),
      ),
    );
  }
}

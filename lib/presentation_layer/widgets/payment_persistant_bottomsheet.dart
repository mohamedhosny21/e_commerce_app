import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_slice/business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';
import 'package:home_slice/constants/dimensions.dart';
import 'package:home_slice/constants/styles.dart';

import '../../constants/colors.dart';

class PaymentPersistantBottomSheet extends StatelessWidget {
  const PaymentPersistantBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
    return Container(
      decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      padding: AppDimensions.paddingSymmetricH10V20,
      height: 260.h,
      child: Column(
        children: [
          Center(
            child: Text(
              'Payment Details',
              style: MyTextStyles.font20NavyBlueBold,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                'Total Items :',
                style: MyTextStyles.font18NavyBlueBold,
              ),
              trailing: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Text(
                    '${cartCubit.cartPizzaItems.length}',
                    style: MyTextStyles.font18NavyBlueBold,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                'Sub Total :',
                style: MyTextStyles.font18NavyBlueBold,
              ),
              trailing: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  cartCubit.getPaymentPrice();
                  // print(cartCubit.subTotalPrice);
                  return Text(
                    '\$ ${cartCubit.subTotalPrice.toStringAsFixed(2)}',
                    style: MyTextStyles.font18NavyBlueBold,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                'Delivery Fee :',
                style: MyTextStyles.font18NavyBlueBold,
              ),
              trailing: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  return Text(
                    '\$ ${cartCubit.deliveryFee}',
                    style: MyTextStyles.font18NavyBlueBold,
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: AppDimensions.marginTop30,
              child: const Divider(
                color: MyColors.navyBlue,
                thickness: 2,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              title: Text(
                'Total Price :',
                style: MyTextStyles.font18NavyBlueBold,
              ),
              trailing: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  cartCubit.getPaymentPrice();
                  // print(cartCubit.totalPrice);
                  return Text(
                    '\$ ${cartCubit.totalPrice.toStringAsFixed(2)}',
                    style: MyTextStyles.font18NavyBlueBold,
                  );
                },
              ),
            ),
          ),
          AppDimensions.verticalSpacing20,
          MaterialButton(
            height: 45.h,
            onPressed: () {},
            textColor: Colors.white,
            color: MyColors.navyBlue,
            minWidth: double.infinity,
            child: Text(
              'Order Now',
              style: MyTextStyles.font20WhiteBold,
            ),
          )
        ],
      ),
    );
  }
}

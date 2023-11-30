import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/cubit/cart_cubit/cubit/cart_cubit.dart';

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
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20))),
      padding: const EdgeInsetsDirectional.fromSTEB(10, 20, 10, 20),
      height: 270,
      child: Column(
        children: [
          const Center(
            child: Text(
              'Payment Details',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: MyColors.myNavyBlue,
                  fontSize: 20),
            ),
          ),
          Expanded(
            child: ListTile(
              title: const Text(
                'Total Items :',
                style: TextStyle(
                  color: MyColors.myNavyBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  print(cartCubit.cartPizzaItems.length);
                  return Text(
                    '${cartCubit.cartPizzaItems.length}',
                    style: const TextStyle(
                      color: MyColors.myNavyBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListTile(
              title: const Text(
                'Sub Total :',
                style: TextStyle(
                  color: MyColors.myNavyBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  cartCubit.getPaymentPrice();
                  // print(cartCubit.subTotalPrice);
                  return Text(
                    '\$ ${cartCubit.subTotalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: MyColors.myNavyBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ),
          ),
          const Expanded(
            child: ListTile(
              title: Text(
                'Delivery Fee :',
                style: TextStyle(
                  color: MyColors.myNavyBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: Text(
                '\$ ${10}',
                style: TextStyle(
                  color: MyColors.myNavyBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: const Divider(
                color: MyColors.myNavyBlue,
                thickness: 2,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: ListTile(
              title: const Text(
                'Total Price :',
                style: TextStyle(
                  color: MyColors.myNavyBlue,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              trailing: BlocBuilder<CartCubit, CartState>(
                builder: (context, state) {
                  cartCubit.getPaymentPrice();
                  // print(cartCubit.totalPrice);
                  return Text(
                    '\$ ${cartCubit.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: MyColors.myNavyBlue,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          MaterialButton(
            height: 50,
            onPressed: () {},
            textColor: Colors.white,
            color: MyColors.myNavyBlue,
            minWidth: double.infinity,
            child: const Text(
              'Order Now',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}

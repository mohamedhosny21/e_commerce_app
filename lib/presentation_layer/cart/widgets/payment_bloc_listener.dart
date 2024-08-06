import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_slice/business_logic_layer/payment_cubit/payment_cubit.dart';
import 'package:home_slice/core/routing/routes.dart';
import 'package:home_slice/helpers/snackbar.dart';

import '../../../business_logic_layer/cart_cubit/cubit/cart_cubit.dart';
import '../../../helpers/circular_progress_indicator.dart';

class PaymentBlocListener extends StatelessWidget {
  final Widget child;
  const PaymentBlocListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentLoading) {
          showCircularProgressIndicator(context);
        } else if (state is PaymentSuccess) {
          Navigator.pop(context);
          Navigator.pushNamed(context, Routes.transactionCompletedScreen);
          context.read<CartCubit>().deleteAllCartItems();
        } else if (state is PaymentSheetInitialized) {
          Navigator.pop(context);
        } else if (state is PaymentFailed) {
          Navigator.pop(context);
          showErrorSnackBar(context, context.tr('Payment_Transaction_Failed'));
        }
      },
      child: child,
    );
  }
}

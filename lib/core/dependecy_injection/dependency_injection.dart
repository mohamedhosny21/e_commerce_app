import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:home_slice/business_logic_layer/payment_cubit/payment_cubit.dart';
import 'package:home_slice/business_logic_layer/pizza_api_cubit/pizza_cubit.dart';
import 'package:home_slice/data_layer/repository/payments_repository.dart';
import 'package:home_slice/data_layer/repository/pizza_repository.dart';
import 'package:home_slice/data_layer/webservices/payment_webservices.dart';
import 'package:home_slice/data_layer/webservices/pizza_webservices.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  final PizzaWebServices pizzaWebServices = PizzaWebServices();
  final PaymentWebservices paymentWebservices = PaymentWebservices();
  getIt.registerFactory<PizzaRepository>(
      () => PizzaRepository(pizzaWebServices));
  getIt.registerFactory<PizzaCubit>(() => PizzaCubit(getIt()));
  getIt.registerFactory<PaymentsRepository>(
      () => PaymentsRepository(paymentWebservices));
  getIt.registerFactory<PaymentCubit>(() => PaymentCubit(getIt()));
}

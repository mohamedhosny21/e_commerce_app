import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data_layer/repository/payments_repository.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  final PaymentsRepository _paymentsRepository;
  PaymentCubit(this._paymentsRepository) : super(PaymentInitial());
  void makePayment(int amount) async {
    emit(PaymentLoading());
    try {
      await _paymentsRepository.makePayment(amount);
      emit(PaymentSheetInitialized());
      await _presentPaymentSheet();
      emit(PaymentSuccess());
    } catch (error) {
      emit(PaymentFailed());
    }
  }

  Future<void> _presentPaymentSheet() async {
    await _paymentsRepository.presentPaymentSheet();
  }

  void createStripeCustomer() async {
    _paymentsRepository.createStripeCustomer();
  }

  void onchange(Change<PaymentState> change) {
    super.onChange(change);
    log(change.toString());
  }
}

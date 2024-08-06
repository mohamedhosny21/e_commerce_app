class InitPaymentInputModel {
  final String merchantDisplayName,
      paymentIntentClientSecret,
      customerEphemeralKeySecret,
      customerId;

  InitPaymentInputModel(
      {required this.merchantDisplayName,
      required this.paymentIntentClientSecret,
      required this.customerEphemeralKeySecret,
      required this.customerId});
}

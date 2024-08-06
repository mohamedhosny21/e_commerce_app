class PaymentIntentInputModel {
  final String currency, customerId;
  final int amount;

  PaymentIntentInputModel(
      {required this.amount, required this.currency, required this.customerId});

  Map<String, dynamic> toJson() {
    return {
      'amount': amount * 100,
      'currency': currency,
      'customer': customerId
    };
  }
}

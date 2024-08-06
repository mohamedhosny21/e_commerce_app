import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:home_slice/data_layer/models/customer_input_model.dart';
import '../models/customer_model.dart';
import '../models/ephemeral_key_model.dart';
import '../models/init_payment_input_model.dart';
import '../models/payment_intent_input_model.dart';
import '../webservices/payment_webservices.dart';

import '../models/payment_intent_model.dart';

class PaymentsRepository {
  final PaymentWebservices _paymentWebServices;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  PaymentsRepository(this._paymentWebServices);
  Future<void> makePayment(int amount) async {
    final customerId = await _getStripeCutomerId();
    final PaymentIntentInputModel paymentIntentInputModel =
        PaymentIntentInputModel(
            amount: amount, currency: 'usd', customerId: customerId);
    final PaymentIntentModel paymentIntentModel =
        await _createPaymentIntent(paymentIntentInputModel);
    final EphemeralKeyModel ephemeralKeyModel =
        await _generateEphemeralKey(paymentIntentModel.customerId!);
    final InitPaymentInputModel initPaymentInputModel = InitPaymentInputModel(
        merchantDisplayName: 'Home Slice Staff',
        paymentIntentClientSecret: paymentIntentModel.clientSecret!,
        customerEphemeralKeySecret: ephemeralKeyModel.secret!,
        customerId: paymentIntentModel.customerId!);
    await _initPaymentSheet(initPaymentInputModel);
  }

  Future<PaymentIntentModel> _createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    final response =
        await _paymentWebServices.createPaymentIntent(paymentIntentInputModel);
    return PaymentIntentModel.fromJson(response.data);
  }

  Future<void> _initPaymentSheet(
      InitPaymentInputModel initPaymentInputModel) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      merchantDisplayName: initPaymentInputModel.merchantDisplayName,
      paymentIntentClientSecret:
          initPaymentInputModel.paymentIntentClientSecret,
      customerId: initPaymentInputModel.customerId,
      customerEphemeralKeySecret:
          initPaymentInputModel.customerEphemeralKeySecret,
    ));
  }

  Future<void> presentPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<CustomerModel> createStripeCustomer() async {
    final customer = _firebaseAuth.currentUser!;
    final CustomerInputModel customerInputModel = CustomerInputModel(
      customerName: customer.displayName!,
      email: customer.email!,
    );
    final response =
        await _paymentWebServices.createStripeCustomer(customerInputModel);
    final CustomerModel customerResponseModel =
        CustomerModel.fromJson(response.data);
    await _storeStripeCutomerId(customerResponseModel.id!);

    return customerResponseModel;
  }

  Future<EphemeralKeyModel> _generateEphemeralKey(String customerId) async {
    final response = await _paymentWebServices.generateEphemeralKey(customerId);

    return EphemeralKeyModel.fromJson(response.data);
  }

  Future<void> _storeStripeCutomerId(String customerId) async {
    await _firestore
        .collection("StripeCustomers")
        .doc(_firebaseAuth.currentUser!.uid)
        .set({"stripe_customer_id": customerId});
  }

  Future<String> _getStripeCutomerId() async {
    final DocumentSnapshot snapshot = await _firestore
        .collection("StripeCustomers")
        .doc(_firebaseAuth.currentUser!.uid)
        .get();
    return snapshot.get("stripe_customer_id");
  }
}

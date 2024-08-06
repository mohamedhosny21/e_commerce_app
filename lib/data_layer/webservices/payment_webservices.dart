import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:home_slice/data_layer/models/customer_input_model.dart';
import '../../core/constants/api_constants.dart';
import '../../core/constants/dio_connection.dart';
import '../models/payment_intent_input_model.dart';

class PaymentWebservices {
  Future<Response> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    try {
      final response = await DioConnections(baseUrl: ApiConstants.stripeBaseUrl)
          .dio
          .post(ApiConstants.paymentIntentEndPoint,
              data: paymentIntentInputModel.toJson(),
              options: Options(
                  contentType: Headers.formUrlEncodedContentType,
                  headers: {
                    'Authorization': 'Bearer ${ApiConstants.stripeSecretKey}',
                  }));
      debugPrint('payment Intent Data :${response.data.toString()}');
      return response;
    } catch (error) {
      debugPrint('create payment intent error $error');

      throw Exception(error);
    }
  }

  Future<Response> createStripeCustomer(
      CustomerInputModel customerInputModel) async {
    try {
      final response = await DioConnections(baseUrl: ApiConstants.stripeBaseUrl)
          .dio
          .post(ApiConstants.customerEndPoint,
              data: customerInputModel.toJson(),
              options: Options(
                  contentType: Headers.formUrlEncodedContentType,
                  headers: {
                    'Authorization': 'Bearer ${ApiConstants.stripeSecretKey}'
                  }));
      debugPrint('customer data :${response.data.toString()}');

      return response;
    } catch (error) {
      debugPrint('create customer error $error');
      throw Exception(error);
    }
  }

  Future<Response> generateEphemeralKey(String customerId) async {
    try {
      final response = await DioConnections(baseUrl: ApiConstants.stripeBaseUrl)
          .dio
          .post(ApiConstants.ephemeralKeyEndPoint,
              data: {'customer': customerId},
              options: Options(headers: {
                'Authorization': 'Bearer ${ApiConstants.stripeSecretKey}',
                'Stripe-Version': ApiConstants.stripeVersion
              }, contentType: Headers.formUrlEncodedContentType));
      debugPrint('Ephemeral Key data :${response.data.toString()}');

      return response;
    } catch (error) {
      debugPrint('create ephemeral key error $error');
      throw Exception(error);
    }
  }
}

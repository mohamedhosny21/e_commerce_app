import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  static const String pizzaBaseUrl = 'http://192.168.1.3:3000';

  static const String pizzaEndPoint = '/allpizza';

  static String twitterApiKey = dotenv.env['TWITTER_API_KEY']!;

  static String twitterApiSecretKey = dotenv.env['TWITTER_API_SECRET_KEY']!;

  static String stripePublishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;

  static String stripeSecretKey = dotenv.env['STRIPE_SECRET_KEY']!;
  static String stripeBaseUrl = dotenv.env['STRIPE_BASE_URL']!;
  static const String paymentIntentEndPoint = "/payment_intents";
  static const String customerEndPoint = "/customers";
  static const String ephemeralKeyEndPoint = '/ephemeral_keys';
  static const String stripeVersion = '2024-06-20';
}

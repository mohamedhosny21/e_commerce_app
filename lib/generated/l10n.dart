// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Eat Fresh Pizza`
  String get home_title {
    return Intl.message(
      'Eat Fresh Pizza',
      name: 'home_title',
      desc: '',
      args: [],
    );
  }

  /// `Our daily fresh pizza`
  String get home_subtitle {
    return Intl.message(
      'Our daily fresh pizza',
      name: 'home_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Four Cheese Pizza`
  String get Four_Cheese_Pizza {
    return Intl.message(
      'Four Cheese Pizza',
      name: 'Four_Cheese_Pizza',
      desc: '',
      args: [],
    );
  }

  /// `Pepperoni Pizza`
  String get Pepperoni_Pizza {
    return Intl.message(
      'Pepperoni Pizza',
      name: 'Pepperoni_Pizza',
      desc: '',
      args: [],
    );
  }

  /// `BBQ Chicken Pizza`
  String get BBQ_Chicken_Pizza {
    return Intl.message(
      'BBQ Chicken Pizza',
      name: 'BBQ_Chicken_Pizza',
      desc: '',
      args: [],
    );
  }

  /// `Hawaiian Pizza`
  String get Hawaiian_Pizza {
    return Intl.message(
      'Hawaiian Pizza',
      name: 'Hawaiian_Pizza',
      desc: '',
      args: [],
    );
  }

  /// `Vegetarian Pizza`
  String get Vegan_Pizza {
    return Intl.message(
      'Vegetarian Pizza',
      name: 'Vegan_Pizza',
      desc: '',
      args: [],
    );
  }

  /// `Margherita Pizza`
  String get Margharita_Pizza {
    return Intl.message(
      'Margherita Pizza',
      name: 'Margharita_Pizza',
      desc: '',
      args: [],
    );
  }

  /// `Show Now`
  String get ShowNow {
    return Intl.message(
      'Show Now',
      name: 'ShowNow',
      desc: '',
      args: [],
    );
  }

  /// `A collection of best tasting pizza and most popular one`
  String get Pizza_Desc {
    return Intl.message(
      'A collection of best tasting pizza and most popular one',
      name: 'Pizza_Desc',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `Favorite`
  String get Favorite {
    return Intl.message(
      'Favorite',
      name: 'Favorite',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get Cart {
    return Intl.message(
      'Cart',
      name: 'Cart',
      desc: '',
      args: [],
    );
  }

  /// `Add To Cart`
  String get AddToCart {
    return Intl.message(
      'Add To Cart',
      name: 'AddToCart',
      desc: '',
      args: [],
    );
  }

  /// `Remove From Cart`
  String get RemoveFromCart {
    return Intl.message(
      'Remove From Cart',
      name: 'RemoveFromCart',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Time`
  String get DeliveryTime {
    return Intl.message(
      'Delivery Time',
      name: 'DeliveryTime',
      desc: '',
      args: [],
    );
  }

  /// `15 min`
  String get fifteenMin {
    return Intl.message(
      '15 min',
      name: 'fifteenMin',
      desc: '',
      args: [],
    );
  }

  /// `Small`
  String get small {
    return Intl.message(
      'Small',
      name: 'small',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `Large`
  String get large {
    return Intl.message(
      'Large',
      name: 'large',
      desc: '',
      args: [],
    );
  }

  /// `Favorites Pizza`
  String get FavoritesPizza {
    return Intl.message(
      'Favorites Pizza',
      name: 'FavoritesPizza',
      desc: '',
      args: [],
    );
  }

  /// `Cart Items`
  String get CartItems {
    return Intl.message(
      'Cart Items',
      name: 'CartItems',
      desc: '',
      args: [],
    );
  }

  /// `Payment Details`
  String get PaymentDetails {
    return Intl.message(
      'Payment Details',
      name: 'PaymentDetails',
      desc: '',
      args: [],
    );
  }

  /// `Total Items`
  String get TotalItems {
    return Intl.message(
      'Total Items',
      name: 'TotalItems',
      desc: '',
      args: [],
    );
  }

  /// `Subtotal`
  String get Subtotal {
    return Intl.message(
      'Subtotal',
      name: 'Subtotal',
      desc: '',
      args: [],
    );
  }

  /// `Delivery Fee`
  String get DeliveryFee {
    return Intl.message(
      'Delivery Fee',
      name: 'DeliveryFee',
      desc: '',
      args: [],
    );
  }

  /// `Total Price`
  String get TotalPrice {
    return Intl.message(
      'Total Price',
      name: 'TotalPrice',
      desc: '',
      args: [],
    );
  }

  /// `Order Now`
  String get OrderNow {
    return Intl.message(
      'Order Now',
      name: 'OrderNow',
      desc: '',
      args: [],
    );
  }

  /// `Help`
  String get Help {
    return Intl.message(
      'Help',
      name: 'Help',
      desc: '',
      args: [],
    );
  }

  /// `About US`
  String get AboutUs {
    return Intl.message(
      'About US',
      name: 'AboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get English {
    return Intl.message(
      'English',
      name: 'English',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get Arabic {
    return Intl.message(
      'Arabic',
      name: 'Arabic',
      desc: '',
      args: [],
    );
  }

  /// `Choose Language`
  String get ChooseLanguage {
    return Intl.message(
      'Choose Language',
      name: 'ChooseLanguage',
      desc: '',
      args: [],
    );
  }

  /// `must be at least 8 characters`
  String get must_be_at_least_8_characters {
    return Intl.message(
      'must be at least 8 characters',
      name: 'must_be_at_least_8_characters',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password`
  String get Enter_Your_Password {
    return Intl.message(
      'Enter Your Password',
      name: 'Enter_Your_Password',
      desc: '',
      args: [],
    );
  }

  /// `Password not match`
  String get Password_not_match {
    return Intl.message(
      'Password not match',
      name: 'Password_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Your Password`
  String get Confirm_Your_Password {
    return Intl.message(
      'Confirm Your Password',
      name: 'Confirm_Your_Password',
      desc: '',
      args: [],
    );
  }

  /// `Search for a pizza`
  String get Search_for_a_pizza {
    return Intl.message(
      'Search for a pizza',
      name: 'Search_for_a_pizza',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email To Reset Password`
  String get Enter_Your_Email_To_Reset_Password {
    return Intl.message(
      'Enter Your Email To Reset Password',
      name: 'Enter_Your_Email_To_Reset_Password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password ?`
  String get Forgot_Password {
    return Intl.message(
      'Forgot Password ?',
      name: 'Forgot_Password',
      desc: '',
      args: [],
    );
  }

  /// `Email has been sent to`
  String get Email_has_been_sent_to {
    return Intl.message(
      'Email has been sent to',
      name: 'Email_has_been_sent_to',
      desc: '',
      args: [],
    );
  }

  /// `Check your inbox to verify your email`
  String get Check_your_inbox_to_verify_your_email {
    return Intl.message(
      'Check your inbox to verify your email',
      name: 'Check_your_inbox_to_verify_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Resend`
  String get Resend {
    return Intl.message(
      'Resend',
      name: 'Resend',
      desc: '',
      args: [],
    );
  }

  /// `Your email isn't verified yet !!`
  String get Your_email_is_not_verified_yet {
    return Intl.message(
      'Your email isn\'t verified yet !!',
      name: 'Your_email_is_not_verified_yet',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification`
  String get Email_Verification {
    return Intl.message(
      'Email Verification',
      name: 'Email_Verification',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get Login {
    return Intl.message(
      'Login',
      name: 'Login',
      desc: '',
      args: [],
    );
  }

  /// `Or`
  String get Or {
    return Intl.message(
      'Or',
      name: 'Or',
      desc: '',
      args: [],
    );
  }

  /// `Sign In With Google`
  String get Sign_In_With_Google {
    return Intl.message(
      'Sign In With Google',
      name: 'Sign_In_With_Google',
      desc: '',
      args: [],
    );
  }

  /// `Sign In With Facebook`
  String get Sign_In_With_Facebook {
    return Intl.message(
      'Sign In With Facebook',
      name: 'Sign_In_With_Facebook',
      desc: '',
      args: [],
    );
  }

  /// `Sign In With X`
  String get Sign_In_With_X {
    return Intl.message(
      'Sign In With X',
      name: 'Sign_In_With_X',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get Sign_Up {
    return Intl.message(
      'Sign Up',
      name: 'Sign_Up',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email`
  String get Enter_Your_Email {
    return Intl.message(
      'Enter Your Email',
      name: 'Enter_Your_Email',
      desc: '',
      args: [],
    );
  }

  /// `ادخل اسمك`
  String get Enter_Your_Name {
    return Intl.message(
      'ادخل اسمك',
      name: 'Enter_Your_Name',
      desc: '',
      args: [],
    );
  }

  /// `Ooops,something-went-wrong`
  String get Ooops_something_went_wrong {
    return Intl.message(
      'Ooops,something-went-wrong',
      name: 'Ooops_something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `required*`
  String get required {
    return Intl.message(
      'required*',
      name: 'required',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

class PaymentIntentModel {
  String? id;
  String? object;
  int? amount;
  int? amountCapturable;
  AmountDetails? amountDetails;
  int? amountReceived;
  dynamic application;
  dynamic applicationFeeAmount;
  AutomaticPaymentMethods? automaticPaymentMethods;
  dynamic canceledAt;
  dynamic cancellationReason;
  String? captureMethod;
  String? clientSecret;
  String? confirmationMethod;
  int? created;
  String? currency;
  String? customerId;
  dynamic description;
  dynamic invoice;
  dynamic lastPaymentError;
  dynamic latestCharge;
  bool? livemode;
  Metadata? metadata;
  dynamic nextAction;
  dynamic onBehalfOf;
  dynamic paymentMethod;
  dynamic paymentMethodConfigurationDetails;
  PaymentMethodOptions? paymentMethodOptions;
  List<String>? paymentMethodTypes;
  dynamic processing;
  dynamic receiptEmail;
  dynamic review;
  dynamic setupFutureUsage;
  dynamic shipping;
  dynamic source;
  dynamic statementDescriptor;
  dynamic statementDescriptorSuffix;
  String? status;
  dynamic transferData;
  dynamic transferGroup;

  PaymentIntentModel(
      {this.id,
      this.object,
      this.amount,
      this.amountCapturable,
      this.amountDetails,
      this.amountReceived,
      this.application,
      this.applicationFeeAmount,
      this.automaticPaymentMethods,
      this.canceledAt,
      this.cancellationReason,
      this.captureMethod,
      this.clientSecret,
      this.confirmationMethod,
      this.created,
      this.currency,
      this.customerId,
      this.description,
      this.invoice,
      this.lastPaymentError,
      this.latestCharge,
      this.livemode,
      this.metadata,
      this.nextAction,
      this.onBehalfOf,
      this.paymentMethod,
      this.paymentMethodConfigurationDetails,
      this.paymentMethodOptions,
      this.paymentMethodTypes,
      this.processing,
      this.receiptEmail,
      this.review,
      this.setupFutureUsage,
      this.shipping,
      this.source,
      this.statementDescriptor,
      this.statementDescriptorSuffix,
      this.status,
      this.transferData,
      this.transferGroup});

  PaymentIntentModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["object"] is String) {
      object = json["object"];
    }
    if (json["amount"] is int) {
      amount = json["amount"];
    }
    if (json["amount_capturable"] is int) {
      amountCapturable = json["amount_capturable"];
    }
    if (json["amount_details"] is Map) {
      amountDetails = json["amount_details"] == null
          ? null
          : AmountDetails.fromJson(json["amount_details"]);
    }
    if (json["amount_received"] is int) {
      amountReceived = json["amount_received"];
    }
    application = json["application"];
    applicationFeeAmount = json["application_fee_amount"];
    if (json["automatic_payment_methods"] is Map) {
      automaticPaymentMethods = json["automatic_payment_methods"] == null
          ? null
          : AutomaticPaymentMethods.fromJson(json["automatic_payment_methods"]);
    }
    canceledAt = json["canceled_at"];
    cancellationReason = json["cancellation_reason"];
    if (json["capture_method"] is String) {
      captureMethod = json["capture_method"];
    }
    if (json["client_secret"] is String) {
      clientSecret = json["client_secret"];
    }
    if (json["confirmation_method"] is String) {
      confirmationMethod = json["confirmation_method"];
    }
    if (json["created"] is int) {
      created = json["created"];
    }
    if (json["currency"] is String) {
      currency = json["currency"];
    }
    if (json["customer"] is String) {
      customerId = json["customer"];
    }
    description = json["description"];
    invoice = json["invoice"];
    lastPaymentError = json["last_payment_error"];
    latestCharge = json["latest_charge"];
    if (json["livemode"] is bool) {
      livemode = json["livemode"];
    }
    if (json["metadata"] is Map) {
      metadata =
          json["metadata"] == null ? null : Metadata.fromJson(json["metadata"]);
    }
    nextAction = json["next_action"];
    onBehalfOf = json["on_behalf_of"];
    paymentMethod = json["payment_method"];
    paymentMethodConfigurationDetails =
        json["payment_method_configuration_details"];
    if (json["payment_method_options"] is Map) {
      paymentMethodOptions = json["payment_method_options"] == null
          ? null
          : PaymentMethodOptions.fromJson(json["payment_method_options"]);
    }
    if (json["payment_method_types"] is List) {
      paymentMethodTypes = json["payment_method_types"] == null
          ? null
          : List<String>.from(json["payment_method_types"]);
    }
    processing = json["processing"];
    receiptEmail = json["receipt_email"];
    review = json["review"];
    setupFutureUsage = json["setup_future_usage"];
    shipping = json["shipping"];
    source = json["source"];
    statementDescriptor = json["statement_descriptor"];
    statementDescriptorSuffix = json["statement_descriptor_suffix"];
    if (json["status"] is String) {
      status = json["status"];
    }
    transferData = json["transfer_data"];
    transferGroup = json["transfer_group"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["object"] = object;
    data["amount"] = amount;
    data["amount_capturable"] = amountCapturable;
    if (amountDetails != null) {
      data["amount_details"] = amountDetails?.toJson();
    }
    data["amount_received"] = amountReceived;
    data["application"] = application;
    data["application_fee_amount"] = applicationFeeAmount;
    if (automaticPaymentMethods != null) {
      data["automatic_payment_methods"] = automaticPaymentMethods?.toJson();
    }
    data["canceled_at"] = canceledAt;
    data["cancellation_reason"] = cancellationReason;
    data["capture_method"] = captureMethod;
    data["client_secret"] = clientSecret;
    data["confirmation_method"] = confirmationMethod;
    data["created"] = created;
    data["currency"] = currency;
    data["customer"] = customerId;
    data["description"] = description;
    data["invoice"] = invoice;
    data["last_payment_error"] = lastPaymentError;
    data["latest_charge"] = latestCharge;
    data["livemode"] = livemode;
    if (metadata != null) {
      data["metadata"] = metadata?.toJson();
    }
    data["next_action"] = nextAction;
    data["on_behalf_of"] = onBehalfOf;
    data["payment_method"] = paymentMethod;
    data["payment_method_configuration_details"] =
        paymentMethodConfigurationDetails;
    if (paymentMethodOptions != null) {
      data["payment_method_options"] = paymentMethodOptions?.toJson();
    }
    if (paymentMethodTypes != null) {
      data["payment_method_types"] = paymentMethodTypes;
    }
    data["processing"] = processing;
    data["receipt_email"] = receiptEmail;
    data["review"] = review;
    data["setup_future_usage"] = setupFutureUsage;
    data["shipping"] = shipping;
    data["source"] = source;
    data["statement_descriptor"] = statementDescriptor;
    data["statement_descriptor_suffix"] = statementDescriptorSuffix;
    data["status"] = status;
    data["transfer_data"] = transferData;
    data["transfer_group"] = transferGroup;
    return data;
  }
}

class PaymentMethodOptions {
  Card? card;

  PaymentMethodOptions({this.card});

  PaymentMethodOptions.fromJson(Map<String, dynamic> json) {
    if (json["card"] is Map) {
      card = json["card"] == null ? null : Card.fromJson(json["card"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (card != null) {
      data["card"] = card?.toJson();
    }
    return data;
  }
}

class Card {
  dynamic installments;
  dynamic mandateOptions;
  dynamic network;
  String? requestThreeDSecure;

  Card(
      {this.installments,
      this.mandateOptions,
      this.network,
      this.requestThreeDSecure});

  Card.fromJson(Map<String, dynamic> json) {
    installments = json["installments"];
    mandateOptions = json["mandate_options"];
    network = json["network"];
    if (json["request_three_d_secure"] is String) {
      requestThreeDSecure = json["request_three_d_secure"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["installments"] = installments;
    data["mandate_options"] = mandateOptions;
    data["network"] = network;
    data["request_three_d_secure"] = requestThreeDSecure;
    return data;
  }
}

class Metadata {
  Metadata();

  Metadata.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

class AutomaticPaymentMethods {
  String? allowRedirects;
  bool? enabled;

  AutomaticPaymentMethods({this.allowRedirects, this.enabled});

  AutomaticPaymentMethods.fromJson(Map<String, dynamic> json) {
    if (json["allow_redirects"] is String) {
      allowRedirects = json["allow_redirects"];
    }
    if (json["enabled"] is bool) {
      enabled = json["enabled"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["allow_redirects"] = allowRedirects;
    data["enabled"] = enabled;
    return data;
  }
}

class AmountDetails {
  Tip? tip;

  AmountDetails({this.tip});

  AmountDetails.fromJson(Map<String, dynamic> json) {
    if (json["tip"] is Map) {
      tip = json["tip"] == null ? null : Tip.fromJson(json["tip"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (tip != null) {
      data["tip"] = tip?.toJson();
    }
    return data;
  }
}

class Tip {
  Tip();

  Tip.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    return data;
  }
}

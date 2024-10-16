import 'package:checkout_payment/core/utils/api_keys.dart';
import 'package:checkout_payment/core/utils/api_service.dart';
import 'package:checkout_payment/core/utils/constants.dart';
import 'package:checkout_payment/features/checkout/data/models/init_payment_sheet_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:checkout_payment/features/checkout/data/models/customer_model/customer_model.dart';
import 'package:checkout_payment/features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_payment/features/checkout/data/models/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  ApiService apiService = ApiService(Dio());
  Future<CustomerModel> createCustomer() async {
    // ignore: missing_required_param
    Response resopnse = await apiService.postRequest(
      baseUrl: kStripeBaseUrl,
      endPoint: 'v1/customers',
      token: ApiKeys.stripeSecretKey,
      contentType: Headers.formUrlEncodedContentType,
    );
    Map<String, dynamic> jsonData = resopnse.data;
    CustomerModel customerModel = CustomerModel.fromJson(jsonData);
    return customerModel;
  }

  Future<PaymentIntentModel> createPaymentIntent(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    Response resopnse = await apiService.postRequest(
        baseUrl: kStripeBaseUrl,
        endPoint: 'v1/payment_intents',
        token: ApiKeys.stripeSecretKey,
        contentType: Headers.formUrlEncodedContentType,
        body: paymentIntentInputModel.toJson());
    Map<String, dynamic> jsonData = resopnse.data;
    PaymentIntentModel paymentIntentModel =
        PaymentIntentModel.fromJson(jsonData);

    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey(
      {String customerId = 'cus_R2GVCrHZSZNfBp'}) async {
    Response resopnse = await apiService.postRequest(
      baseUrl: kStripeBaseUrl,
      endPoint: 'v1/ephemeral_keys',
      token: ApiKeys.stripeSecretKey,
      contentType: Headers.formUrlEncodedContentType,
      headersInput: {
        'Authorization':'Bearer ${ApiKeys.stripeSecretKey}',
        'Content-Type': 'application/x-www-form-urlencoded',
        'Stripe-Version': '2024-09-30.acacia'
      },
      body: {
        "customer": customerId,
      },
    );
    Map<String, dynamic> jsonData = resopnse.data;
    EphemeralKeyModel ephemeralKeyModel = EphemeralKeyModel.fromJson(jsonData);
    return ephemeralKeyModel;
  }

  Future<void> initPaymentSheet(
      {required InitiPaymentSheetInputModel
          initiPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Set to true for custom flow
        customFlow: false,
        // Main params
        merchantDisplayName: 'Amir Ahmed',
        paymentIntentClientSecret: initiPaymentSheetInputModel.clientSecret,
        // Customer keys
        customerEphemeralKeySecret: initiPaymentSheetInputModel.ephemeralKey,
        customerId: initiPaymentSheetInputModel.customerId,
        // Extra options
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  makePayment(
      {String customerid = 'cus_R2GVCrHZSZNfBp',
      required PaymentIntentInputModel paymentIntentInputModel}) async {
    EphemeralKeyModel ephemeralKey =
        await createEphemeralKey();
    PaymentIntentModel paymentIntentModel = await createPaymentIntent(
        paymentIntentInputModel: paymentIntentInputModel);
    await initPaymentSheet(
      initiPaymentSheetInputModel: InitiPaymentSheetInputModel(
          clientSecret: paymentIntentModel.clientSecret!,
          ephemeralKey: ephemeralKey.secret,
          customerId: customerid),
    );
    await displayPaymentSheet();
  }
}

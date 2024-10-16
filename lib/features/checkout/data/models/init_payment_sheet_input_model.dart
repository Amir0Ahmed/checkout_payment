class InitiPaymentSheetInputModel {
  final String clientSecret;
  final String? ephemeralKey;
  final String? customerId;

  InitiPaymentSheetInputModel(
      {required this.clientSecret,
      required this.ephemeralKey,
      required this.customerId});
}

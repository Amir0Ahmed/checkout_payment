class PaymentIntentInputModel {
  final String currency;
  final int amount;
  final String customer;

  PaymentIntentInputModel(
      {required this.currency, required this.amount, required this.customer});

  Map<String, String> toJson() => {
        "currency": currency,
        "amount": "${amount * 100}",
        "customer": customer,
      };
}

class PaymentIntentInputModel {
  final String amount;
  final String Currency;

  PaymentIntentInputModel({required this.amount, required this.Currency});

  toJSon() {
    return {'amount': amount, 'currency': Currency};
  }
}

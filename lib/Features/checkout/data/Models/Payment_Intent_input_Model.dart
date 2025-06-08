class PaymentIntentInputModel {
  final String amount;
  final String Currency;
  final String Customerid;

  PaymentIntentInputModel({
    required this.Customerid,
    required this.amount,
    required this.Currency,
  });

  Map<String, dynamic> toMap() {
    return {
      'amount': num.parse(amount) * 100,
      'currency': Currency,
      'payment_method_types[]': 'card',
      'customer' : Customerid, 
    };
  }
}

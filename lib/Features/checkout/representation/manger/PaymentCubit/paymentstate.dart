sealed class Paymentstate {}

final class PaymentSuceess extends Paymentstate {}

final class PaymentFailure extends Paymentstate {
  final String errMessage;

  PaymentFailure({required this.errMessage});
}

final class PaymentIntail extends Paymentstate {}

final class PaymentLoading extends Paymentstate {}

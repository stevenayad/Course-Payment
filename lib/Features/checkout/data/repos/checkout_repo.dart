import 'package:dartz/dartz.dart';
import 'package:payment/Core/Utilies/Faliure.dart';
import 'package:payment/Features/checkout/data/Models/Payment_Intent_input_Model.dart';

abstract class CheckoutRepo {
  Future<Either<Faliure, void>> makepayment({
    required PaymentIntentInputModel PaymentIntentInputModel,
  });
}

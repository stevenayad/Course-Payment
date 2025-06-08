import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment/Core/Utilies/Faliure.dart';
import 'package:payment/Core/Utilies/SctripeScrevice.dart';
import 'package:payment/Core/Utilies/apiService.dart';
import 'package:payment/Features/checkout/data/Models/Payment_Intent_input_Model.dart';
import 'package:payment/Features/checkout/data/repos/checkout_repo.dart';

class CheckoutRepoImplemtation extends CheckoutRepo {
  final Sctripescrevice apiservice = Sctripescrevice();
  @override
  Future<Either<Faliure, void>> makepayment({
    required PaymentIntentInputModel PaymentIntentInputModel,
  }) async {
    try {
      await apiservice.makepayment(paymet: PaymentIntentInputModel);
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(errMessage: e.toString()));
    }
  }
}

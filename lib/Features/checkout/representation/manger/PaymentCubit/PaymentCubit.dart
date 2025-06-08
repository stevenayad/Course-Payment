import 'dart:developer'; // For log()

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/data/Models/Payment_Intent_input_Model.dart';
import 'package:payment/Features/checkout/data/repos/checkout_repo.dart';
import 'package:payment/Features/checkout/representation/manger/PaymentCubit/paymentstate.dart'
    show
        PaymentFailure,
        PaymentIntail,
        PaymentLoading,
        PaymentSuccess,
        PaymentSuceess,
        Paymentstate;

class PaymentCubit extends Cubit<Paymentstate> {
  PaymentCubit(this.checkoutRepo) : super(PaymentIntail());

  final CheckoutRepo checkoutRepo;

  Future<void> makepayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(PaymentLoading());

    final result = await checkoutRepo.makepayment(
      PaymentIntentInputModel: paymentIntentInputModel,
    );

    result.fold(
      (failure) => emit(PaymentFailure(errMessage: failure.errMessage)),
      (_) => emit(PaymentSuceess()),
    );
  }

  @override
  void onChange(Change<Paymentstate> change) {
    log(change.toString()); // Clear and unambiguous now
    super.onChange(change);
  }
}

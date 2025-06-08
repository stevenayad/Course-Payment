import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Core/Utilies/Apikey.dart';
import 'package:payment/Core/Utilies/apiService.dart';
import 'package:payment/Features/checkout/data/Models/InitpaymentInputModel.dart';
import 'package:payment/Features/checkout/data/Models/Payment_Intent_input_Model.dart';
import 'package:payment/Features/checkout/data/Models/ephermrakey_model/ephermrakey_model.dart';
import 'package:payment/Features/checkout/data/Models/payment_intent/payment_intent.dart';

class Sctripescrevice {
  final Apiservice apiservice = Apiservice();

  Future<PaymentIntentModel> createpayment(
    PaymentIntentInputModel paymet,
  ) async {
    try {
      //print('🟡 Payment Body: ${paymet.toMap()}');
      final response = await apiservice.post(
        ContentType: Headers.formUrlEncodedContentType,
        token: Apikey.SecertApi,
        url: 'https://api.stripe.com/v1/payment_intents',
        body: paymet.toMap(),
      );

      // print('✅ Stripe Response: ${response.data}');
      return PaymentIntentModel.fromJson(response.data);
    } catch (e) {
      if (e is DioError) {
        print('❌ DioError: ${e.response?.data}');
        print('❌ Status code: ${e.response?.statusCode}');
        print('❌ Headers: ${e.response?.headers}');
        print('❌ Request: ${e.requestOptions}');
      } else {
        print('❌ Unknown error: $e');
      }
      rethrow;
    }
  }

  Future initpaymentsheet({
    required Initpaymentinputmodel initPaymentinputmodel,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentinputmodel.ClientSceret,
        customerEphemeralKeySecret: initPaymentinputmodel.empyrailsceretkey,
        customerId: initPaymentinputmodel.Customerid,
        merchantDisplayName: 'Steven',
      ),
    );
  }

  Future displaypaymentsheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makepayment({required PaymentIntentInputModel paymet}) async {
    var paymentinitModel = await createpayment(paymet);
    if (paymentinitModel.clientSecret == null) {
      throw Exception('Client secret is null');
    }
    var EPhymerialkey = await createEPhymerialkey(paymet.Customerid);

    var initPaymentinputmodel = Initpaymentinputmodel(
      ClientSceret: paymentinitModel.clientSecret!,
      Customerid: paymet.Customerid,
      empyrailsceretkey: EPhymerialkey.secret!,
    );
    await initpaymentsheet(initPaymentinputmodel: initPaymentinputmodel);

    await displaypaymentsheet();
  }

  Future<EphermrakeyModel> createEPhymerialkey(String CustomerId) async {
    try {
      final response = await apiservice.post(
        ContentType: Headers.formUrlEncodedContentType,
        token: Apikey.SecertApi,
        url: 'https://api.stripe.com/v1/ephemeral_keys',
        body: {'customer': CustomerId},
        header: {
          'Authorization': 'Bearer ${Apikey.SecertApi}',
          'Stripe-Version': '2023-08-16',
        },
      );

      print('✅ Stripe Response: ${response.data}');
      return EphermrakeyModel.fromJson(response.data);
    } catch (e) {
      if (e is DioError) {
        print('❌ DioError: ${e.response?.data}');
        print('❌ Status code: ${e.response?.statusCode}');
        print('❌ Headers: ${e.response?.headers}');
        print('❌ Request: ${e.requestOptions}');
      } else {
        print('❌ Unknown error: $e');
      }
      rethrow;
    }
  }
}

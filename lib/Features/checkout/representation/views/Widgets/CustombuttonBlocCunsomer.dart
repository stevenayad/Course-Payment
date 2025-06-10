import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment/Core/Utilies/Apikey.dart';
import 'package:payment/Features/checkout/data/Models/Payment_Intent_input_Model.dart';
import 'package:payment/Features/checkout/data/Models/amount_model/amount_model.dart';
import 'package:payment/Features/checkout/data/Models/amount_model/details.dart';
import 'package:payment/Features/checkout/data/Models/itemlist_model/item.dart';
import 'package:payment/Features/checkout/data/Models/itemlist_model/itemlist_model.dart';
import 'package:payment/Features/checkout/representation/manger/PaymentCubit/PaymentCubit.dart';
import 'package:payment/Features/checkout/representation/manger/PaymentCubit/paymentstate.dart';
import 'package:payment/Features/checkout/representation/views/ThankyouView.dart';
import 'package:payment/widget/CustomButton..dart';

class CustomButtomButtonCusomer extends StatelessWidget {
  const CustomButtomButtonCusomer({super.key, required this.ispaypal});

  final bool ispaypal;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, Paymentstate>(
      listener: (context, state) {
        if (state is PaymentSuceess) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => const Thankyouview()));
        } else if (state is PaymentFailure) {
          Navigator.of(context).pop();
          final snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Custombutton(
          isloading: state is PaymentLoading,
          onPressed: () {
            if (ispaypal) {
              var transtionData = gettranstion();
              Exectuepaypalpayment(context, transtionData);
            } else {
              excuteStripePayment(context);
            }
          },
          name: 'Continue',
        );
      },
    );
  }

  void excuteStripePayment(BuildContext context) {
    PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
      amount: '100',
      Currency: 'usd',
      Customerid: 'cus_SSKrPNlAa7AdOh',
    );
    BlocProvider.of<PaymentCubit>(
      context,
    ).makepayment(paymentIntentInputModel: paymentIntentInputModel);
  }

  void Exectuepaypalpayment(
    BuildContext context,
    ({AmountModel amount, ItemlistModel itemlist}) transtionData,
  ) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder:
            (BuildContext context) => PaypalCheckoutView(
              sandboxMode: true,
              clientId: Apikey.Clientid,
              secretKey: Apikey.paypalSecertAPi,
              transactions: [
                {
                  "amount": transtionData.amount.toJson(),
                  "description": "The payment transaction description.",
                  "item_list": transtionData.itemlist.toJson(),
                },
              ],
              note: "Contact us for any questions on your order.",
              onSuccess: (Map params) async {
                log("onSuccess: $params");
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (content) => Thankyouview()),
                  (route) {
                    log(route.toString());
                    if (route.settings.name == '/') {
                      return true;
                    } else {
                      return false;
                    }
                  },
                );
              },
              onError: (error) {
                log("onError: $error");
                final snackBar = SnackBar(
                  content: Text(error.errMessage.toString()),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              onCancel: () {
                log("cancelled");
                Navigator.pop(context);
              },
            ),
      ),
    );
  }

  ({AmountModel amount, ItemlistModel itemlist}) gettranstion() {
    AmountModel amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: Details(shipping: "0", shippingDiscount: 0, subtotal: "100"),
    );

    List<orderlist> orders = [
      orderlist(name: "Apple", quantity: 4, price: "10", currency: "USD"),
      orderlist(name: "banana", quantity: 12, price: "5", currency: "USD"),
    ];

    ItemlistModel itemlist = ItemlistModel(items: orders);

    return (itemlist: itemlist, amount: amount);
  }

  /*({AmountModel amount, ItemlistModel itemlist}) gettranstion() {
  List<orderlist> orders = [
    orderlist(name: "Apple", quantity: 4, price: "10", currency: "USD"),
    orderlist(name: "Banana", quantity: 12, price: "5", currency: "USD"),
  ];

  double subtotal = 0;
  for (var item in orders) {
    subtotal += item.quantity * double.parse(item.price);
  }

  AmountModel amount = AmountModel(
    total: subtotal.toStringAsFixed(2),
    currency: 'USD',
    details: Details(
      shipping: "0",
      shippingDiscount: 0,
      subtotal: subtotal.toStringAsFixed(2),
    ),
  );

  ItemlistModel itemlist = ItemlistModel(items: orders);

  return (itemlist: itemlist, amount: amount);
}*/
}

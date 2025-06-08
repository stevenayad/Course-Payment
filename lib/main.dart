import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/Core/Utilies/Apikey.dart';
import 'package:payment/Features/checkout/representation/views/MyCardView.dart';

void main() {
  Stripe.publishableKey = Apikey.pushilshedkey;
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Mycardview(), debugShowCheckedModeBanner: false);
  }
}

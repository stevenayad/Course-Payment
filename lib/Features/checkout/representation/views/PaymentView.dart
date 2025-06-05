import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/Payment_view_body.dart';
import 'package:payment/widget/CustomAppbar.dart';

class Paymentview extends StatelessWidget {
  const Paymentview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
      body: PaymentViewBody(),
    );
  }
}

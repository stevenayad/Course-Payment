import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/Thankyoubody.dart';
import 'package:payment/widget/CustomAppbar.dart';

class Thankyouview extends StatelessWidget {
  const Thankyouview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildAppBar(), body: ThankYouBody());
  }
}

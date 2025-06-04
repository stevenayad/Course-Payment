import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/Customcheckoutcard.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/Thankyoucard.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/dashline.dart';

class ThankYouBody extends StatelessWidget {
  const ThankYouBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),

      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ThankYouCard(),

          Dashline(),
          Positioned(
            child: CircleAvatar(),
            bottom: MediaQuery.of(context).size.height * 0.2,
            left: -20,
          ),
          Positioned(
            child: CircleAvatar(),
            bottom: MediaQuery.of(context).size.height * 0.2,
            right: -20,
          ),
          customCheckoutCard(),
        ],
      ),
    );
  }
}

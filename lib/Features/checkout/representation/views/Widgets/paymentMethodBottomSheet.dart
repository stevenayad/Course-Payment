import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/paymenmethodtlistview.dart';
import 'package:payment/widget/CustomButton..dart';

class PaymentMethodBottomSheet extends StatelessWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12),
          paymenmethodtlistview(),
          SizedBox(height: 32),
          Custombutton(name: 'Continue'),
        ],
      ),
    );
  }
}

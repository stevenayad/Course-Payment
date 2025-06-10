import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/representation/views/ThankyouView.dart';

import 'package:payment/Features/checkout/representation/views/Widgets/CustomCreditCard.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/paymenmethodtlistview.dart';
import 'package:payment/widget/CustomButton..dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
       // SliverToBoxAdapter(child: paymenmethodtlistview()),
        SliverToBoxAdapter(
          child: CustomCreditCard(
            formKey: formkey,
            autovalidateMode: autovalidateMode,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(right: 16, left: 16, bottom: 12),
              child: Custombutton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return Thankyouview();
                        },
                      ),
                    );
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                name: 'Payment',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

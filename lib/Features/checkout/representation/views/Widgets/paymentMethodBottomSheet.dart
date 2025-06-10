import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/data/Models/Payment_Intent_input_Model.dart';
import 'package:payment/Features/checkout/representation/manger/PaymentCubit/PaymentCubit.dart';
import 'package:payment/Features/checkout/representation/manger/PaymentCubit/paymentstate.dart';
import 'package:payment/Features/checkout/representation/views/ThankyouView.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/CustombuttonBlocCunsomer.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/paymenmethodtlistview.dart';
import 'package:payment/widget/CustomButton..dart';

class PaymentMethodBottomSheet extends StatefulWidget {
  const PaymentMethodBottomSheet({super.key});

  @override
  State<PaymentMethodBottomSheet> createState() =>
      _PaymentMethodBottomSheetState();
}

class _PaymentMethodBottomSheetState extends State<PaymentMethodBottomSheet> {
  bool ispaybool = false;

  void changepaymentMethod({required int index}) {
    if (index == 0) {
      ispaybool = false;
    } else if (index == 1) {
      ispaybool = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 12),
          paymenmethodtlistview(changeMethodpayment: changepaymentMethod,),
          SizedBox(height: 32),
          CustomButtomButtonCusomer(ispaypal: ispaybool),
        ],
      ),
    );
  }
}

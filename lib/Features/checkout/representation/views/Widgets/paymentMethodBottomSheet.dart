import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/Features/checkout/data/Models/Payment_Intent_input_Model.dart';
import 'package:payment/Features/checkout/representation/manger/PaymentCubit/PaymentCubit.dart';
import 'package:payment/Features/checkout/representation/manger/PaymentCubit/paymentstate.dart';
import 'package:payment/Features/checkout/representation/views/ThankyouView.dart';
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
          CustomButtomButtonCusomer(),
        ],
      ),
    );
  }
}

class CustomButtomButtonCusomer extends StatelessWidget {
  const CustomButtomButtonCusomer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, Paymentstate>(
      listener: (context, state) {
        if (state is PaymentSuceess) {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => Thankyouview()));
        }

        if (state is PaymentFailure) {
          Navigator.of(context).pop();
          SnackBar snackBar = SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        return Custombutton(
          isloading: state is PaymentLoading ? true : false,
          onPressed: () {
            PaymentIntentInputModel PaymentIntentInput =
                PaymentIntentInputModel(
                  amount: '100',
                  Currency: 'usd',
                  Customerid: 'cus_SSKrPNlAa7AdOh',
                );
            BlocProvider.of<PaymentCubit>(
              context,
            ).makepayment(paymentIntentInputModel: PaymentIntentInput);
          },
          name: 'Continue',
        );
      },
    );
  }
}

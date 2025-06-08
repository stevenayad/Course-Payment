import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:payment/Features/checkout/data/repos/checkout_repo_implemtation.dart';
import 'package:payment/Features/checkout/representation/manger/PaymentCubit/PaymentCubit.dart';
import 'package:payment/Features/checkout/representation/views/PaymentView.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/paymenmethodtlistview.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/paymentMethodBottomSheet.dart';
import 'package:payment/widget/CustomButton..dart';
import 'package:payment/Features/checkout/representation/views/Widgets/Orderinfotitle.dart';

class Mycardviewbody extends StatelessWidget {
  const Mycardviewbody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 18),
          Expanded(child: Image.asset('assets/images/Group6.png')),
          SizedBox(height: 25),
          Orderinfotitlee(title: 'Order Subtotal', value: r'$42.97'),
          SizedBox(height: 3),
          Orderinfotitlee(title: 'Discount', value: r'$0'),
          SizedBox(height: 3),
          Orderinfotitlee(title: 'Shipping', value: r'$8'),
          const Divider(thickness: 2, color: Color(0xffC7C7C7), height: 34),
          Orderinfotitlee(title: 'Total', value: r'$50.97'),
          SizedBox(height: 16),
          Custombutton(
            name: 'Complete Payment',
            onPressed: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => Paymentview()),
              );*/

              showBottomSheet(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                builder: (context) {
                  return BlocProvider(
                    create:
                        (context) => PaymentCubit(CheckoutRepoImplemtation()),
                    child: PaymentMethodBottomSheet(),
                  );
                },
              );
            },
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}

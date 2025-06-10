import 'package:flutter/material.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/Payment_method_item.dart';

class paymenmethodtlistview extends StatefulWidget {
  const paymenmethodtlistview({super.key, required this.changeMethodpayment});
  final Function({required int index}) changeMethodpayment;
  @override
  State<paymenmethodtlistview> createState() => _paymenmethodtlistviewState();
}

class _paymenmethodtlistviewState extends State<paymenmethodtlistview> {
  int activeindex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> items = const [
      'assets/images/Card.svg',
      'assets/images/paypal.svg',
    ];
    return SizedBox(
      height: 62,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                activeindex = index;
                widget.changeMethodpayment(index: index);
                setState(() {});
              },
              child: PaymentMethodItem(
                isActive: activeindex == index,
                image: items[index],
              ),
            ),
          );
        },
      ),
    );
  }
}

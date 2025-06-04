import 'package:flutter/material.dart';
import 'package:payment/Core/Utilies/styles.dart';

class paymentInfoItem extends StatelessWidget {
  const paymentInfoItem({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 1),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Styles.style18, textAlign: TextAlign.center),
          Text(value, style: Styles.styleBold18, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

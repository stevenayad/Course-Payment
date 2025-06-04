import 'package:flutter/material.dart';
import 'package:payment/Core/Utilies/styles.dart';

class Orderinfotitle extends StatelessWidget {
  const Orderinfotitle({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: Styles.style24),
        Spacer(),
        Text(value, style: Styles.style24),
      ],
    );
  }
}

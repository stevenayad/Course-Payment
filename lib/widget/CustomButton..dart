import 'package:flutter/material.dart';
import 'package:payment/Core/Utilies/styles.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, this.onPressed, required this.name});

  final void Function()? onPressed;
  final String name;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Text(name, style: Styles.style22),
    );
  }
}

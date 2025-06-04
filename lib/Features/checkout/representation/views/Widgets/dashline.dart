import 'package:flutter/material.dart';

class Dashline extends StatelessWidget {
  const Dashline({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 36, // 20 + 16
      right: 36,
      bottom: MediaQuery.of(context).size.height * 0.15,
      child: SizedBox(
        height: 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            30,
            (index) =>
                Container(width: 5, height: 2, color: const Color(0xffB8B8B8)),
          ),
        ),
      ),
    );
  }
}

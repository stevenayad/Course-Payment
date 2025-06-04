import 'package:flutter/material.dart';

class customCheckoutCard extends StatelessWidget {
  const customCheckoutCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      top: -20,
      child: CircleAvatar(
        radius: 50, // half of height
        backgroundColor: Color(0xffD9D9D9),
        child: CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xff34A853),
          child: Icon(Icons.check, size: 50, color: Colors.white),
        ),
      ),
    );
  }
}

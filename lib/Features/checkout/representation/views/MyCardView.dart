import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:payment/Core/Utilies/styles.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/MycardViewbody.dart';

class Mycardview extends StatelessWidget {
  const Mycardview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.asset('assets/images/Arrow1.svg')),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("My Cart", style: Styles.style25),
      ),
      body: Mycardviewbody(),
    );
  }
}

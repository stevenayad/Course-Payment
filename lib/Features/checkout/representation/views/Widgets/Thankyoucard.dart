import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment/Core/Utilies/styles.dart';
import 'package:payment/Features/checkout/representation/views/Widgets/Cardinfowedget.dart';

import 'package:payment/Features/checkout/representation/views/Widgets/PaymentInfoItem.dart'
    show paymentInfoItem;
import 'package:payment/Features/checkout/representation/views/Widgets/total_price_order.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        color: const Color(0xFFEDEDED),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 50 + 16, left: 22, right: 22),
        child: Column(
          children: [
            SizedBox(height: 22),
            const Text(
              'Thank you!',
              textAlign: TextAlign.center,
              style: Styles.style25,
            ),
            SizedBox(height: 12),
            Text(
              'Your transaction was successful',
              textAlign: TextAlign.center,
              style: Styles.style20,
            ),
            const SizedBox(height: 42),
            const paymentInfoItem(title: 'Date', value: '01/24/2023'),
            const paymentInfoItem(title: 'Time', value: '10:15 AM'),
            const paymentInfoItem(title: 'To', value: 'Sam Louis'),
            const Divider(thickness: 2),
            const Orderinfotitle(title: 'Total', value: r'$50.97'),
            const CardInfoWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(FontAwesomeIcons.barcode, size: 64),
                Container(
                  margin: EdgeInsets.all(12),
                  width: 113,
                  height: 58,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        width: 1.50,
                        color: Color(0xFF34A853),
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PAID',
                      textAlign: TextAlign.center,
                      style: Styles.style24.copyWith(
                        color: const Color(0xff34A853),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 23),
          ],
        ),
      ),
    );
  }
}

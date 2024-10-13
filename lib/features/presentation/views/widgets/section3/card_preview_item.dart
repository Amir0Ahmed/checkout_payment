import 'package:checkout_payment/core/utils/styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardPreviewItem extends StatelessWidget {
  const CardPreviewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 20,
          ),
          Center(
            child: SvgPicture.asset('assets/images/card_logo.svg'),
          ),
          const SizedBox(
            width: 20,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Credit Card',
                style: Styles.style18,
              ),
              Text(
                'Mastercard **78',
                style: Styles.style18,
              ),
            ],
          )
        ],
      ),
    );
  }
}

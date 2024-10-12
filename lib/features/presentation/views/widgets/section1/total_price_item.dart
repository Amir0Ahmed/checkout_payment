import 'package:checkout_payment/core/utils/styles.dart';
import 'package:checkout_payment/features/data/models/total_price_model.dart';
import 'package:flutter/material.dart';

class TotalPriceItem extends StatelessWidget {
  const TotalPriceItem({super.key, required this.totalPriceModel});
  final TotalPriceModel totalPriceModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          totalPriceModel.item,
          style: Styles.style24,
        ),
        const Spacer(),
        Text(
          totalPriceModel.value,
          style: Styles.style24,
        ),
      ],
    );
  }
}

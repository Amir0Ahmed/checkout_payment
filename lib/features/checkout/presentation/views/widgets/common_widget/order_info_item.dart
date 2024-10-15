import 'package:checkout_payment/core/utils/styles.dart';
import 'package:checkout_payment/features/checkout/data/models/order_info_model.dart';
import 'package:flutter/material.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem({
    super.key,
    required this.orderInfoModel,
  });
  final OrderInfoModel orderInfoModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          orderInfoModel.item,
          style: Styles.style18,
        ),
        const Spacer(),
        Text(
          orderInfoModel.value,
          style: Styles.style18,
        ),
      ],
    );
  }
}

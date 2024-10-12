import 'package:checkout_payment/core/widgets/custom_button.dart';
import 'package:checkout_payment/features/data/models/order_info_model.dart';
import 'package:checkout_payment/features/data/models/total_price_model.dart';
import 'package:checkout_payment/features/presentation/views/payment_details_view.dart';
import 'package:checkout_payment/features/presentation/views/widgets/section1/order_info_item.dart';
import 'package:checkout_payment/features/presentation/views/widgets/section1/total_price_item.dart';
import 'package:flutter/material.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});
  static const List<OrderInfoModel> items = [
    OrderInfoModel(item: 'Order Subtotal', value: r'$42.97'),
    OrderInfoModel(item: 'Discount', value: r'$0'),
    OrderInfoModel(item: 'Shipping', value: r'$$0'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25,
        ),
        Expanded(
          child: Image.asset(
            'assets/images/item.png',
            fit: BoxFit.fill,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        OrderInfoItem(orderInfoModel: items[0]),
        const SizedBox(
          height: 3,
        ),
        OrderInfoItem(orderInfoModel: items[1]),
        const SizedBox(
          height: 3,
        ),
        OrderInfoItem(orderInfoModel: items[2]),
        const Divider(
          thickness: 2,
          height: 30,
          color: Color(0xffC7C7C7),
        ),
        const SizedBox(
          height: 16,
        ),
        TotalPriceItem(
          totalPriceModel: TotalPriceModel(item: 'Total', value: r'$50.97'),
        ),
        const SizedBox(
          height: 16,
        ),
        CustomButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const PaymentDetailsView();
                },
              ),
            );
          },
          title: 'Complete Payment',
        ),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

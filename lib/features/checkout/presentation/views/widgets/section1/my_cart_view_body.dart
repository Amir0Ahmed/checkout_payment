import 'package:checkout_payment/core/widgets/custom_button.dart';
import 'package:checkout_payment/features/checkout/data/models/order_info_model.dart';
import 'package:checkout_payment/features/checkout/data/models/total_price_model.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/common_widget/order_info_item.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/section1/payment_details_model_bottom_sheet.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/section1/total_price_item.dart';
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
            showModalBottomSheet(
              elevation: 0,
              context: context,
              builder: (context) {
                return const PaymentDetailsModelBottomSheet();
              },
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

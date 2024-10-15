import 'package:checkout_payment/core/utils/styles.dart';
import 'package:checkout_payment/features/checkout/data/models/order_info_model.dart';
import 'package:checkout_payment/features/checkout/data/models/total_price_model.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/common_widget/order_info_item.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/section1/total_price_item.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/section3/card_preview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThankYouCard extends StatelessWidget {
  const ThankYouCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
          color: const Color(0xffEDEDED),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Thank you!',
            style: Styles.style25,
          ),
          Text(
            'Your transaction was successful',
            style: Styles.style20,
          ),
          const SizedBox(
            height: 40,
          ),
          const OrderInfoItem(
            orderInfoModel: OrderInfoModel(item: 'Date', value: '01/24/2023'),
          ),
          const SizedBox(
            height: 20,
          ),
          const OrderInfoItem(
            orderInfoModel: OrderInfoModel(item: 'Time', value: '10:15 AM'),
          ),
          const SizedBox(
            height: 20,
          ),
          const OrderInfoItem(
            orderInfoModel: OrderInfoModel(item: 'To', value: 'Sam Louis'),
          ),
          const Divider(
            thickness: 2,
            color: Color(0xffC7C7C7),
            height: 40,
          ),
          TotalPriceItem(
            totalPriceModel: TotalPriceModel(item: 'Total', value: r'$50.97'),
          ),
          const SizedBox(
            height: 30,
          ),
          const CardPreviewItem(),
          const Spacer(),
          Row(
            children: [
              SvgPicture.asset(
                'assets/images/SVGRepo_iconCarrier.svg',
                height: 54,
              ),
              const Spacer(),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 29),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    width: 1.5,
                    color: const Color(0xff34A853),
                  ),
                ),
                child: Text(
                  'PAID',
                  style: Styles.style24.copyWith(
                    color: const Color(0xff34A853),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: (MediaQuery.sizeOf(context).height * .16) / 2 - 27,
          ),
        ],
      ),
    );
  }
}

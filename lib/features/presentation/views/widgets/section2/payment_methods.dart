import 'package:checkout_payment/features/presentation/views/widgets/section2/payment_method_item.dart';
import 'package:flutter/material.dart';

class PaymentMethods extends StatefulWidget {
  const PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  int currentIndex = 0;
  List items = ['assets/images/card.svg', 'assets/images/paypal.svg'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            if (currentIndex != index) {
              currentIndex = index;
              setState(() {});
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20),
            child: PaymentMethodsItem(
              image: items[index],
              isActive: currentIndex == index,
            ),
          ),
        );
      },
    );
  }
}

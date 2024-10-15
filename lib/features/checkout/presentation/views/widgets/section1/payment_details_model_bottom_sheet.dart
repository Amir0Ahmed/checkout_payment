import 'package:checkout_payment/core/widgets/custom_button.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/section2/payment_methods.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/section3/thank_you_view.dart';
import 'package:flutter/material.dart';

class PaymentDetailsModelBottomSheet extends StatelessWidget {
  const PaymentDetailsModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .42,
      child: Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
              child: PaymentMethods(),
            ),
            const Spacer(),
            CustomButton(
              title: 'pay',
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) {
                      return const ThankYouView();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

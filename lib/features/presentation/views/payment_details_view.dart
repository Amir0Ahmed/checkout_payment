import 'package:checkout_payment/core/utils/functions/build_app_bar.dart';
import 'package:checkout_payment/features/presentation/views/widgets/section2/payment_details_view_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Payment Details'),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: PaymentDetailsViewBody(),
      ),
    );
  }
}

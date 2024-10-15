import 'package:checkout_payment/core/utils/functions/build_app_bar.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/section3/thank_you_view_body.dart';
import 'package:flutter/material.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: ''),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: ThankYouViewBody(),
      ),
    );
  }
}

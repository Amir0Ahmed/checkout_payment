import 'package:checkout_payment/core/widgets/custom_button.dart';
import 'package:checkout_payment/features/presentation/views/widgets/section2/custom_credit_card.dart';
import 'package:checkout_payment/features/presentation/views/widgets/section2/payment_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              const SizedBox(
                height: 80,
                child: PaymentMethods(),
              ),
              const SizedBox(
                height: 30,
              ),
              CustomCreditCard(
                formKey: formKey,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: 35,
                ),
              ),
              CustomButton(title: 'Pay'),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:checkout_payment/core/widgets/custom_button.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/section2/custom_credit_card.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/section2/payment_methods.dart';
import 'package:checkout_payment/features/checkout/presentation/views/widgets/section3/thank_you_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({super.key});

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
                autovalidateMode: autovalidateMode,
                formKey: formKey,
              ),
            ],
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              const Expanded(
                child: SizedBox(
                  height: 35,
                ),
              ),
              CustomButton(
                title: 'Pay',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const ThankYouView();
                        },
                      ),
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

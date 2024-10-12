import 'package:checkout_payment/features/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CheckOutPayment());
}

class CheckOutPayment extends StatelessWidget {
  const CheckOutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}

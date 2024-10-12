import 'package:checkout_payment/core/utils/functions/build_app_bar.dart';
import 'package:checkout_payment/features/presentation/views/widgets/section1/my_cart_view_body.dart';
import 'package:flutter/material.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: MyCartViewBody(),
      ),
    );
  }
}

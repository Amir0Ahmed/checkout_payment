import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentMethodsItem extends StatelessWidget {
  const PaymentMethodsItem(
      {super.key, this.isActive = false, required this.image});
  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 50),
      height: 62,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: isActive == true
            ? Border.all(
                color: const Color(0xff34A853),
                width: 5,
              )
            : Border.all(
                color: const Color(0xff000000),
                width: 1,
              ),
      ),
      child: Center(
        child: SvgPicture.asset(
          image,
          fit: BoxFit.scaleDown,
          height: 30,
        ),
      ),
    );
  }
}

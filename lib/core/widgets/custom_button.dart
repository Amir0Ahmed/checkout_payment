import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onPressed});
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: const Color(0XFF34A853),
        padding: const EdgeInsets.symmetric(
          vertical: 23,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: Styles.style22,
        ),
      ),
    );
  }
}

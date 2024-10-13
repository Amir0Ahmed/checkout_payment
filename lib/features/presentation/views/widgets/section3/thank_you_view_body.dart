import 'package:checkout_payment/core/widgets/check_avtar.dart';
import 'package:checkout_payment/core/widgets/custom_dash_line.dart';
import 'package:checkout_payment/features/presentation/views/widgets/section3/thank_you_card.dart';
import 'package:flutter/material.dart';

class ThankYouViewBody extends StatelessWidget {
  const ThankYouViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const ThankYouCard(),
        const Positioned(
          left: 0,
          right: 0,
          top: -60,
          child: CheckAvatar(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: MediaQuery.sizeOf(context).height * .16 + 20,
          child: const CustomDashLine(),
        ),
        Positioned(
          left: -20,
          bottom: MediaQuery.sizeOf(context).height * .16,
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
          ),
        ),
        Positioned(
          right: -20,
          bottom: MediaQuery.sizeOf(context).height * .16,
          child: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.white,
          ),
        ),
      ],
    );
  }
}


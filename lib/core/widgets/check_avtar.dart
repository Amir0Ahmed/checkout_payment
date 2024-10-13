import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CheckAvatar extends StatelessWidget {
  const CheckAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 60,
      backgroundColor: Color(0xffEDEDED),
      child: CircleAvatar(
        backgroundColor: Color(0xff34A853),
        radius: 50,
        child: Icon(
          FontAwesomeIcons.check,
          size: 55,
          color: Color(0xffFFFFFF),
        ),
      ),
    );
  }
}

import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

AppBar buildAppBar({required String? title}) => AppBar(
      leading: Center(child: SvgPicture.asset('assets/images/back_arrow.svg',)),
      title: Text(
        '$title',
        style: Styles.style25,
      ),
      centerTitle: true,
    );

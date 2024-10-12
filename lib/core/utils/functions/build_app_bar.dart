import 'package:checkout_payment/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AppBar buildAppBar({required String? title}) => AppBar(
      leading: const Icon(
        FontAwesomeIcons.arrowLeft,
        size: 35,
      ),
      title: Text(
        '$title',
        style: Styles.style25,
      ),
      centerTitle: true,
    );

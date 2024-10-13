import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class CustomCreditCard extends StatefulWidget {
  const CustomCreditCard({super.key, required this.formKey});
  final GlobalKey<FormState> formKey;
  @override
  State<CustomCreditCard> createState() => _CustomCreditCardState();
}

class _CustomCreditCardState extends State<CustomCreditCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  CardType? cardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView:
                isCvvFocused, //true when you want to show cvv(back) view
            cardType: getCreditCardType(),
            isHolderNameVisible: true,
            onCreditCardWidgetChange: (CreditCardBrand brand) {
              // Callback for anytime credit card brand is changed
            }),
        CreditCardForm(
          formKey: widget.formKey, // Required
          cardNumber: cardNumber, // Required
          expiryDate: expiryDate, // Required
          cardHolderName: cardHolderName, // Required
          cvvCode: cvvCode, // Required

          onCreditCardModelChange: (CreditCardModel data) {
            cardNumber = data.cardNumber;
            expiryDate = data.expiryDate;
            cardHolderName = data.cardHolderName;
            cvvCode = data.cvvCode;
            isCvvFocused = data.isCvvFocused;
            setState(() {});
          },
        ),
      ],
    );
  }

  CardType getCreditCardType() {
    String cardNumbe = cardNumber.replaceAll(RegExp(r'\s+'), '');

    if (cardNumbe.startsWith('4')) {
      return CardType.visa;
    } else if (cardNumbe.startsWith(RegExp(r'^(51|52|53|54|55)'))) {
      return CardType.mastercard;
    } else if (cardNumbe.length >= 4 &&
        int.parse(cardNumbe.substring(0, 4)) >= 2221 &&
        int.parse(cardNumbe.substring(0, 4)) <= 2720) {
      return CardType.mastercard;
    } else if (cardNumbe.startsWith(RegExp(r'^(34|37)'))) {
      return CardType.americanExpress;
    } else if (cardNumbe.startsWith(RegExp(r'^(6011|65)'))) {
      return CardType.discover;
    } else if (cardNumbe.length >= 6 &&
        int.parse(cardNumbe.substring(0, 6)) >= 622126 &&
        int.parse(cardNumbe.substring(0, 6)) <= 622925) {
      return CardType.discover;
    } else if (cardNumbe.length >= 3 &&
        cardNumbe.startsWith(RegExp(r'^(644|645|646|647|648|649)'))) {
      return CardType.discover;
    } else if (cardNumbe.startsWith('62')) {
      return CardType.unionpay;
    } else if (cardNumber.startsWith(RegExp(r'^(60|65|81|82)'))) {
      return CardType.rupay;
    } else if (cardNumbe.startsWith(RegExp(
        r'^(4011|4312|4389|4514|4576|5041|5066|5067|509|6277|6362|6363|650|6516|6550)'))) {
      return CardType.elo;
    } else if (cardNumbe.startsWith(RegExp(r'^(38|60)'))) {
      return CardType.hipercard;
    } else {
      return CardType.otherBrand;
    }
  }
}

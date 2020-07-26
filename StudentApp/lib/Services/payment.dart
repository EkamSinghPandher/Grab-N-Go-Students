import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:flutter/material.dart';

class Payment with ChangeNotifier {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  PaymentMethod method = PaymentMethod();

  Payment.initialize() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            'pk_test_51H8m1jKoQQFZlp0JvTXIGIKeugXPJVPZIXXiSUN51cV0Vm1qhbH6STEjbyoWGIDbLuEc25IOq4VSQELuU1dCr8IN00lv8OPlHQ'));
  }

  void addCard() {
    StripePayment.paymentRequestWithCardForm(CardFormPaymentRequest())
        .then((payment) {
      method = payment;
    }).catchError((onError) => print('payment error'));
  }
}

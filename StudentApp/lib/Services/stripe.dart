import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class StripeServices {
  static const publishableKey =
      "pk_test_51H8m1jKoQQFZlp0JvTXIGIKeugXPJVPZIXXiSUN51cV0Vm1qhbH6STEjbyoWGIDbLuEc25IOq4VSQELuU1dCr8IN00lv8OPlHQ";
  static const secretKey =
      "sk_test_51H8m1jKoQQFZlp0JSyuFllM6eEGo5x2yseuTwKaXHEjylwwG3wadtOdsBbwpYyP7KVrBpu4LYLGT3sZWQkpp1hHE0095OjAzPc";

  Future<void> createStripeCustomer({String email, String userId}) async {
    Map<String, String> data = {
      'email': email,
    };
    Map<String, String> headers = {
      'Authorization': "Bearer $secretKey",
      'Content-Type': "application/x-www-form-urlencoded",
    };
    http
        .post("https://api.stripe.com/v1/customers",
            body: data, headers: headers)
        .then((response) {
      String stripeID = jsonDecode(response.body)["id"];
      print("stripe id is" + stripeID);
    }).catchError((error) {
      print("error with payment");
    });
  }
}

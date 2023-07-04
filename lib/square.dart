import 'package:flutter/material.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final String squareAccessToken =
      'EAAAEOE4PVgGMKwoYrnKuLSpMCGzGjrJE1YlzYrmNw0bFvTtgaBbajymSwOcy1iR'; // Replace with your actual Square access token

  @override
  void initState() {
    super.initState();
    // Initialize Square payment
    InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-Tn-qRYkJBeUZSFlzzy3I4A');
  }

  Future<void> _startSquarePayment() async {
    try {
      // Start the Square payment flow
      await InAppPayments.startCardEntryFlow(
        onCardNonceRequestSuccess: _onCardNonceRequestSuccess,
        onCardEntryCancel: _onCardEntryCancel,
        collectPostalCode: false,
      );
    } catch (error) {
      // Handle error
      print('Error starting card entry flow: $error');
    }
  }

  void _onCardNonceRequestSuccess(CardDetails cardDetails) async {
    try {
      // Complete the Square payment flow
      await InAppPayments.completeCardEntry(
        onCardEntryComplete: _onCardEntryComplete,
      );

      // Make the Square API call to record the payment
      await createPayment(cardDetails.nonce, 10.0,
          'USD'); // Replace with your desired amount and currency
    } catch (error) {
      // Handle error
      print('Error processing payment: $error');
    }
  }

  void _onCardEntryComplete() {
    // Handle the card entry completion
    // Perform any necessary cleanup or navigation
    InAppPayments.completeCardEntry(onCardEntryComplete: _onCardEntryComplete);

    print('Card entry complete');
  }

  void _onCardEntryCancel() {
    // Handle the card entry cancellation
    // Perform any necessary cleanup or navigation

    print('Card entry canceled');
  }

  Future<void> createPayment(
      String paymentNonce, double amount, String currency) async {
    final url = Uri.parse('https://connect.squareup.com/v2/payments');

    final headers = {
      'Authorization': 'Bearer $squareAccessToken',
      'Content-Type': 'application/json',
    };

    final requestBody = {
      'source_id': paymentNonce,
      'amount_money': {'amount': (amount * 100).toInt(), 'currency': currency},
      'idempotency_key': UniqueKey()
          .toString(), // Generate a unique idempotency key for each payment request
    };

    final response =
        await http.post(url, headers: headers, body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      // Payment successfully recorded
      final paymentData = jsonDecode(response.body);
      final transactionId = paymentData['payment']['id'];
      // Store the transactionId or perform further actions
      print('Payment recorded successfully. Transaction ID: $transactionId');

      // Display the payment details
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Payment Successful'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Transaction ID: $transactionId'),
                Text(
                  'Amount: ${paymentData['payment']['amount_money']['amount']} ${paymentData['payment']['amount_money']['currency']}',
                ),
                Text(
                  'Card Brand: ${paymentData['payment']['card_details']['card']['card_brand']}',
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle errors
      print('Error creating payment: ${response.body}');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Payment Error'),
            content: Text('An error occurred while processing the payment.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: _startSquarePayment,
            child: Text('Pay with Square'),
          ),
        ],
      ),
    );
  }
}

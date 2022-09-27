

import 'package:flutter/cupertino.dart';
import 'package:flutter_pagos_stripe/models/stripe_custom_response.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {

  StripeService._privateConstructor();
  static final StripeService _instance = StripeService._privateConstructor();
  factory StripeService() => _instance;

 String _paymentApiUrl = 'https://api.stripe.com/v1/payment_intents';
  static String _secretKey = 'sk_test_51LLGtGFRgUgitcKeJnd2PEayNfmDDVaH1rxBMCwj3GkFXLO75RWEHJ0GSe83kpa4oT4N796KXHDaAN0ca1rLujd90062xCISB5';
  String _apiKey    = 'pk_test_51LLGtGFRgUgitcKeiDWgdRyna5nIBgyUPUemUMLoH16571zd67zGNU16BM8HKEq87Xu56aEKvZjT1qO8b5epFY1F00QokVlL3A';

  void init() {
    
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = _apiKey;
  Stripe.merchantIdentifier = 'test';
  Stripe.stripeAccountId= 'test';
  Stripe.instance.applySettings();

 

  }

  Future pagarConTarjetaExiste()async {

  }
   Future pagarConNuevaTarjeta({
    required String amount,
    required String currency,
    required Card card

   })async {


    try {
    //  final paymentMethod = await StripePayment.paymentRequestWithCardForm(
    //   CardFormPaymentRequest()

    //  );

    }catch (e) {

      return StripeCustomResponse(ok: false, msg: e.toString()
    
      );

    }


    
  }

   Future pagarApplePayGooglePay({
     required String amount,
    required String currency,
   })async {
    
  }

   Future _crearPaymentIntent({
     required String amount,
    required String currency,
   })async {
    
  }

   Future _realizarPago(
    {
       required String amount,
    required String currency,
     required  PaymentMethod paymentMethod
 
    }
   )async {
    
  }
}
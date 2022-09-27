
import 'package:flutter/material.dart';
import 'package:flutter_pagos_stripe/pages/home/home_page.dart';
import 'package:flutter_pagos_stripe/pages/pago/pago_page.dart';
import 'package:flutter_pagos_stripe/pages/splash/splash_page.dart';

final Map<String, WidgetBuilder> appRouter = {
  'home': (BuildContext context) => const HomePage(),
  'splash': (BuildContext context) => const SplashPage(),
   'pago_completo': (BuildContext context) => const PagoPage(),
  
};
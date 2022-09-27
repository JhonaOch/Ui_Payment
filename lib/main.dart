
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagos_stripe/bloc/pagar/pagar_bloc.dart';
import 'package:flutter_pagos_stripe/routes/routes.dart';
import 'package:flutter_pagos_stripe/services/stripe_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    //StripeService().init();
    return MultiBlocProvider(
      providers:[
      BlocProvider(create: (_)=>PagarBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pago App',
        initialRoute: 'home',
        routes: appRouter,
        
        theme: ThemeData.light().copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 64, 4, 99),
          ),
          scaffoldBackgroundColor:Colors.black12
        ),
      ),
    );
  }
}
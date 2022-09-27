import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagos_stripe/bloc/pagar/pagar_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TotalPayButton extends StatelessWidget {
  const TotalPayButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 235, 235, 235),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Total',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('250.55 USD',
                  style: TextStyle(
                    fontSize: 20,
                  ))
            ],
          ),

          //  _btnPay()
          BlocBuilder<PagarBloc, PagarState>(
            builder: (context, state) {
              return _BtnPay(state);
            },
          )
        ],
      ),
    );
  }
}

class _BtnPay extends StatelessWidget {

  final PagarState state;
  const _BtnPay(this.state );

  @override
  Widget build(BuildContext context) {
    print("Dta n: ${state.tarjetaActiva}");
    return state.tarjetaActiva ? _btnTarjeta() : _btnPay();
  }

  Widget _btnTarjeta() {
    return MaterialButton(
      height: 45,
      minWidth: 170,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Color.fromARGB(255, 64, 4, 99),
      child: Row(
        children: const [
          Icon(FontAwesomeIcons.creditCard, color: Colors.white),
          Text('   Pagar', style: TextStyle(fontSize: 22, color: Colors.white))
        ],
      ),
      onPressed: () {},
    );
  }

  Widget _btnPay() {
    return MaterialButton(
      height: 45,
      minWidth: 150,
      shape: const StadiumBorder(),
      elevation: 0,
      color: Color.fromARGB(255, 64, 4, 99),
      child: Row(
        children: [
          Icon(
              Platform.isAndroid
                  ? FontAwesomeIcons.google
                  : FontAwesomeIcons.apple,
              color: Colors.white),
          const Text('  Pay',
              style: TextStyle(fontSize: 22, color: Colors.white))
        ],
      ),
      onPressed: () {},
    );
  }
}

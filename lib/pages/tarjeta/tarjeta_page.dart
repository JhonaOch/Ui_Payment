import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_pagos_stripe/bloc/pagar/pagar_bloc.dart';
import 'package:flutter_pagos_stripe/models/tarjeta_model.dart';

import 'package:flutter_pagos_stripe/pages/home/widgets/total_pay_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TajetaPage extends StatelessWidget {
  const TajetaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.bloc<PagarBloc>();

    final tarjeta =  context.bloc<PagarBloc>().state.tarjeta;

    return Scaffold(
        appBar: AppBar(
          title:Text('Pagar') ,
          leading: IconButton(
            onPressed:(){
              bloc.add(OnDesactivarTarjeta());
               Navigator.pop(context);

            },
          icon: Icon(Icons.arrow_back,) ),
        ),
      body: Stack(
        children:[
          Container(),

           Hero(
            tag: tarjeta!.cardNumber,
             child: CreditCardWidget(
                      cardNumber: tarjeta.cardNumberHidden, 
                      expiryDate: tarjeta.expiracyDate, 
                      cardHolderName: tarjeta.cardHolderName, 
                      cvvCode: tarjeta.cvv,
                       showBackView: false,
                        onCreditCardWidgetChange: (i)
                        {}),
           ),


            Positioned(
            bottom: 0,
            child:TotalPayButton() )


        ]
      )
    );
  }
}
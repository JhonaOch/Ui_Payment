import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:flutter_pagos_stripe/bloc/pagar/pagar_bloc.dart';
import 'package:flutter_pagos_stripe/data/tarjetas_data.dart';
import 'package:flutter_pagos_stripe/helpers/alertas.dart';
import 'package:flutter_pagos_stripe/helpers/navegar_fadein.dart';
import 'package:flutter_pagos_stripe/pages/home/widgets/total_pay_button.dart';
import 'package:flutter_pagos_stripe/pages/tarjeta/tarjeta_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
 
    final size= MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title:const Text('Pagar'),
        actions:  [
          IconButton(onPressed:()async {
            mostratLoading(context);

            await Future.delayed(Duration(seconds: 1));

            Navigator.pop(context);

          }, icon: Icon(Icons.add))

        ],
      ),
      body: 
      Stack(
        children: [
          Positioned(
            width: size.width,
            height: size.height,
            top: 200,
            child: PageView.builder(
              controller: PageController(viewportFraction: 0.9),
              physics:const BouncingScrollPhysics(),
              itemCount: tarjetas.length,
              itemBuilder: (_,i){
          
                final tarjeta = tarjetas[i];
                return GestureDetector(
                  child: Hero(
                    tag: tarjeta.cardNumber,
                    child: CreditCardWidget(
                      cardNumber: tarjeta.cardNumberHidden, 
                      expiryDate: tarjeta.expiracyDate, 
                      cardHolderName: tarjeta.cardHolderName, 
                      cvvCode: tarjeta.cvv,
                       showBackView: false,
                        onCreditCardWidgetChange: (i)
                        {}),
                  ),

                      onTap: (){
                        context.bloc<PagarBloc>().add(OnseleccionarTarjeta(tarjeta));
                        Navigator.push(context, navegarFadeIn(context, TajetaPage()));
                      },
                );
          
              }),
          ),

          Positioned(
            bottom: 0,
            child:TotalPayButton() )
        ]
      )
    );
  }
}
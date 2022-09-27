// ignore: import_of_legacy_library_into_null_safe
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pagos_stripe/models/tarjeta_model.dart';

part 'pagar_event.dart';
part 'pagar_state.dart';

class PagarBloc extends Bloc<PagarEvent, PagarState> {
  PagarBloc() : super(PagarState());

  @override
  Stream<PagarState> mapEventToState(PagarEvent event) async* {
    if (event is OnseleccionarTarjeta) {
      yield state.copyWith(tarjetaActiva: true, tarjeta: event.tarjeta);
    } else if (event is OnDesactivarTarjeta) {
      yield state.copyWith(tarjetaActiva: false);
    }
  }
}

part of 'pagar_bloc.dart';

@immutable
abstract class PagarEvent {}

class OnseleccionarTarjeta extends PagarEvent {
  final TarjetaCredito tarjeta;

  OnseleccionarTarjeta(this.tarjeta);
  
}

class OnDesactivarTarjeta extends PagarEvent {
  
}

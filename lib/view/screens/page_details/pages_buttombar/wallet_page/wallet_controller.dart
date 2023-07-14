import 'package:flutter/material.dart';
import '../../../../../model/evento_model.dart';
import '../../../../../model/trasation_info.dart';

class WalletController {
  final despesas = ValueNotifier<String>('R\$ 0,00');
  //
  final trasationcard = ValueNotifier<TrasationInfo>(
      TrasationInfo(ntransition: '0', strasition: 'R\$ 0,00'));
  //
  final trasationmoney = ValueNotifier<TrasationInfo>(
      TrasationInfo(ntransition: '0', strasition: 'R\$ 0,00'));

  sumValue({required List<Evento> eventos}) {
    double soma = 0;
    for (var e in eventos) {
      soma = soma + double.parse(e.velueEvent);
      despesas.value = soma.toStringAsFixed(2);
    }
  }

  //
  sumtrasation({required List<Evento> eventos}) {
    int tcard = 0;
    int tmoney = 0;
    double vcard = 0;
    double vmoney = 0;
    for (var e in eventos) {
      if (e.paymentEvent == 'Cartão') {
        tcard++;
        vcard = vcard + double.parse(e.velueEvent);
      } else {
        tmoney++;
        vmoney = vmoney + double.parse(e.velueEvent);
      }
    }
    trasationcard.value = TrasationInfo(
        ntransition: tcard.toString(), strasition: vcard.toStringAsFixed(2));
    trasationmoney.value = TrasationInfo(
        ntransition: tmoney.toString(), strasition: vmoney.toStringAsFixed(2));
  }
}
// "Cartão"
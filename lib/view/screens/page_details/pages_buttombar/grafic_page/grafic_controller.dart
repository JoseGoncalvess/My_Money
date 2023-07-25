import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:my_money/controller/formater_date/date_event.dart';
import 'package:my_money/controller/formater_date/event_type.dart';
import 'package:my_money/model/evento_model.dart';

import 'models/category_event.dart';
import 'models/colun_data.dart';
import 'models/payment_model.dart';

class GraficController {
  final listcategory = ValueNotifier<List<CategoryEvent>>([]);

  final listgastomonth = ValueNotifier<List<ColunData>>([]);
  //
  final listvaluepayment = ValueNotifier<List<PaymentModel>>([]);
  //
  final despesas = ValueNotifier<String>('R\$ 0,00');
  //
  final saldo = ValueNotifier<String>('R\$ 0,00');
  //
  final state = ValueNotifier<String>("1");

  getcategorylist({required List<Evento> list}) {
    List<CategoryEvent> catList = [];
    for (var e in list) {
      catList.add(CategoryEvent(
          category: EventType().getEvent(icon: e.categoryEvent),
          valeu: int.parse(e.velueEvent)));
    }
    listcategory.value = catList;
  }

  getdataColun({required List<Evento> list}) {
    List<ColunData> catList = [];
    for (var e in list) {
      catList.add(ColunData(
          xmonth: DateEvent().getMonth(date: e.dateEvent),
          yvalue: double.parse(e.velueEvent)));
    }
    listgastomonth.value = catList;
  }

  getTypePayment({required List<Evento> list}) {
    List<PaymentModel> catList = [];
    double cont = 1;
    for (var e in list) {
      catList.add(PaymentModel(
          xnubermtrasations: cont,
          ytransationtipo1:
              e.paymentEvent == "Cartão" ? double.parse(e.velueEvent) : 0,
          ytransationtipo2:
              e.paymentEvent == "Dinheiro" ? double.parse(e.velueEvent) : 0));
      cont++;
    }
    listvaluepayment.value = catList;
  }

  setstate({required int saldocont, required int dividas}) {
    if (dividas > saldocont) {
      state.value = '3';
    } else if (dividas + (saldocont * (20 / 100)) == saldocont) {
      state.value = '2';
    }
  }

  sumValue({required List<Evento> eventos, required String userSaldo}) {
    double soma = 0;
    for (var e in eventos) {
      soma = soma + double.parse(e.velueEvent);
      despesas.value = soma.toStringAsFixed(2);
    }
    saldo.value = (int.parse(userSaldo) - soma).toStringAsFixed(2);
    setstate(dividas: soma.toInt(), saldocont: int.parse(userSaldo));
  }
}

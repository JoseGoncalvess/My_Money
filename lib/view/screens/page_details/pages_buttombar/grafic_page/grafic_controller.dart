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
}

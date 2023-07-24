import 'package:flutter/material.dart';
import 'package:my_money/controller/formater_date/date_event.dart';
import 'package:my_money/controller/formater_date/event_type.dart';
import 'package:my_money/model/evento_model.dart';

import 'models/category_event.dart';
import 'models/colun_data.dart';

class GraficController {
  final listcategory = ValueNotifier<List<CategoryEvent>>([]);

  final listgastomonth = ValueNotifier<List<ColunData>>([]);
  //
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
}

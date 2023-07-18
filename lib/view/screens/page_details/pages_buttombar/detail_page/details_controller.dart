import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/controller/interface_data.dart';
import 'package:my_money/model/evento_model.dart';
import 'package:my_money/model/shared_preferences.dart';

import '../../../../../model/trasation_info.dart';
import '../../../home_page/home_controller.dart';

class DetailsController extends ValueNotifier<List<Evento>> {
  DetailsController() : super([]);
  //
  //
  HomeController homeController = HomeController();
  //
  List<String> months = InterfaceData().months;

  final month = ValueNotifier<String>('');
  //
  final page$ = ValueNotifier<int>(0);
  final infoevent = ValueNotifier<TrasationInfo>(
      TrasationInfo(ntransition: '0', strasition: 'R\$ 0.00'));

  int get page => page$.value;

  onpagechange({required int pagenum}) {
    month.value = months[pagenum];
    page$.value = pagenum;
    getInfoMoth(pagenum: pagenum + 1);
    log('("Current Page: +${page.toString()})');
  }

  getmes({required String data}) {
    var ldata = data.split('/')[1];

    return ldata;
  }

  Future getInfoMoth({required int pagenum}) async {
    List<Evento> eventMonth = [];
    int nuberTrasition = 0;
    int valueTrasition = 0;
    await homeController.getevetList(key: keyList);
    List<Evento> listEve = homeController.value;
    for (var e in listEve) {
      if (getmes(data: e.dateEvent) == '0$pagenum') {
        eventMonth.add(e);
        valueTrasition = valueTrasition + int.parse(e.velueEvent);
        nuberTrasition++;
      }
    }
    value = eventMonth;
    infoevent.value = TrasationInfo(
        ntransition: nuberTrasition.toString(),
        strasition: 'R\$ $valueTrasition');
  }
}

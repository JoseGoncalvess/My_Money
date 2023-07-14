import 'package:flutter/material.dart';
import 'dart:developer';
import '../../../model/evento_model.dart';
import '../../../model/shared_preferences.dart';

class HomeController extends ValueNotifier<List<Evento>> {
  HomeController() : super([]);
  var userName = ValueNotifier<String?>('Usuario');
  var userMoney = ValueNotifier<String?>('0,00');

  final SharedPrefs prefs = SharedPrefs();

  ///PERCORRRER OS INTEM DA LISTA CONVERTENDO sTRINGJSON EM OBJECT MODL
  Future getevetList({required String key}) async {
    prefs.getListEventos(key: key).then((v) => {log(v.toString()), value = v});
  }

  saveEvent({required String key, required Evento evento}) async {
    prefs
        .saveNewEvent(key: key, evento: evento)
        .then((value) => getevetList(key: keyList));
  }

  ///METODO QUE REVMOVE EVENTO ESPECIFIICO DA LISA DE EVENTOS
  Future removeEvnet({required String key, required int index}) async {
    prefs
        .removeEvnetList(key: key, index: index)
        .then((value) => getevetList(key: keyList));
  }

  Future getName({required String key}) async {
    return userName.value = await prefs.getNameUser(key: key);
  }

  Future getMoney({required String key}) async {
    return userMoney.value = await prefs.getMoneyUser(key: key);
  }
}

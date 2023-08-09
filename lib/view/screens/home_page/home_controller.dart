import 'package:flutter/material.dart';
import '../../../model/evento_model.dart';
import '../../../model/shared_preferences.dart';

class HomeController extends ValueNotifier<List<Evento>> {
  HomeController() : super([]);
  var userName = ValueNotifier<String?>('Usuario');
  var userMoney = ValueNotifier<String?>('0,0');
  var saldo = ValueNotifier<String?>('0,00');
  var userAvatar = ValueNotifier<String?>('assets/img/sem_logo.jpg');

  final SharedPrefs prefs = SharedPrefs();

  ///PERCORRRER OS INTEM DA LISTA CONVERTENDO sTRINGJSON EM OBJECT MODL
  Future getevetList({required String key}) async {
    prefs.getListEventos(key: key).then((v) => {value = v});
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

  Future editingEvent(
      {required String key,
      required int indexEvent,
      required Evento event}) async {
    prefs.editingEvnetList(key: key, index: indexEvent, evento: event);
  }

  Future getName({required String key}) async {
    return userName.value = await prefs.getNameUser(key: key);
  }

  Future getMoney({required String key}) async {
    return userMoney.value = await prefs.getMoneyUser(key: key);
  }

  Future getAvatar({required String key}) async {
    return userAvatar.value = await prefs.getMoneyUser(key: key);
  }

  sumValue({required List<Evento> eventos}) async {
    double soma = 0;
    String userSaldo = await getMoney(key: keyUserMoney);
    for (var e in eventos) {
      soma = soma + double.parse(e.velueEvent);
    }
    saldo.value = (double.parse(userSaldo.replaceFirst(",", ".")) - soma)
        .toStringAsFixed(2);
  }
}

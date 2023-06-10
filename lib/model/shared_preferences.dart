// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'evento_model.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  Future<SharedPreferences> get init async {
    return prefs = await SharedPreferences.getInstance();
  }

  ///METODO RESPONSSAVEL POR SALVAR A LISTA DE EVENTOS:
  Future saveList({required key, required list}) async {
    await SharedPrefs.prefs.setStringList(key, list);
  }

  ///METODO RESPONSSAVEL POR SALVAR A LISTA DE EVENTOS:
  Future<List<String>?> loadList({required String key}) async {
    var listResult = await SharedPrefs.prefs.getStringList(key);
    return listResult;
  }

  //PERCORRRER OS INTEM DA LISTA CONVERTENDO sTRINGJSON EM OBJECT MODLE

  getEventsList({required String key}) {
    loadList(key: key).then((value) {
      List<String>? listString = value;
      for (var e in listString!) {
        var event = jsonDecode(e);
        var i = Evento.fromMap(event);
        return i;
      }
    });
  }
}
//chave da lista 'evento1'
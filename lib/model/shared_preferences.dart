// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'evento_model.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  Future<SharedPreferences> get init async {
    return _prefs = await SharedPreferences.getInstance();
  }

  SharedPreferences get prefs => _prefs;

  ///METODO RESPONSSAVEL POR SALVAR A LISTA DE EVENTOS:
  Future saveList({required key, required list}) async {
    await prefs.setStringList(key, list);
  }

  ///METODO RESPONSSAVEL POR SALVAR A LISTA DE EVENTOS:
  Future<List<String>?> loadList({required String key}) async {
    var listResult = await prefs.getStringList(key) ?? [];
    return listResult;
  }

  ///METODO RESPONSSAVEL POR DELETAR A LISTA DE EVENTOS:
  /// Passando o KEY anes ultilizada no metodo de salvar.
  Future deletList({required String key}) async {
    await prefs.remove(key);
  }

  //
  //METODO QUE REVMOVE EVENTO ESPECIFIICO DA LISA DE EVENTOS
  Future removeEvnetList({required String key, required int index}) async {
    loadList(key: key).then((value) {
      log(value![0]);
    });
  }

  Future saveNewEvent({required String key, required Evento evento}) async {
    List<String>? listStrng = [];
    loadList(key: key).then((value) => {
          listStrng = value,
          listStrng!.add(evento.toJson()),
          saveList(key: key, list: listStrng),
          log(listStrng.toString())
        });
  }

  //PERCORRRER OS INTEM DA LISTA CONVERTENDO sTRINGJSON EM OBJECT MODLE
  List<Evento> getEventsList({required String key}) {
    List<Evento> eventos = [];
    loadList(key: key).then((value) {
      List<String>? listString = value;
      for (var e in listString!) {
        var event = jsonDecode(e);
        var i = Evento.fromMap(event);
        return eventos.add(i);
      }
    });
    return eventos;
  }
}

const String keyList = '@evento';
//chave da lista 'evento1'


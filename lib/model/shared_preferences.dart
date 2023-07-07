// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

import 'evento_model.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;
  List<Evento> eventos = [];

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
    var listResult = prefs.getStringList(key) ?? [];
    return listResult;
  }

  ///METODO RESPONSSAVEL POR DELETAR A LISTA DE EVENTOS:
  /// Passando o KEY anes ultilizada no metodo de salvar.
  Future deletList({required String key}) async {
    await prefs.remove(key);
  }

  ///PERCORRRER OS INTEM DA LISTA CONVERTENDO sTRINGJSON EM OBJECT MODL
  getListEventos({required String key}) async {
    List<Evento> eventos = [];
    loadList(key: key).then((v) {
      List<String> listString = v!;
      for (var i in listString) {
        var event = jsonDecode(i);
        var item = Evento.fromMap(event);
        eventos.add(item);
      }
      return eventos;
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

  ///METODO QUE REVMOVE EVENTO ESPECIFIICO DA LISA DE EVENTOS
  Future removeEvnetList({required String key, required int index}) async {
    List<String>? listStrng = [];
    loadList(key: key).then((v) {
      listStrng = v;
      listStrng!.removeAt(index);
      saveList(key: key, list: listStrng);
    });
  }
}

const String keyList = '@evento';
//chave da lista 'evento1'


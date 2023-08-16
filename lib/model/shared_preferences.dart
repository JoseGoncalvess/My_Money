// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
import 'evento_model.dart';

class SharedPrefs {
  List<String> listString = [];

  ///METODO RESPONSSAVEL POR SALVAR A LISTA DE EVENTOS:
  Future saveList({required String key, required List<String>? list}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, list!);
  }

  //METODO PARA SALVAR EVATRA DO USUARIO
  Future saveAvata({required String key, required String avatar}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, avatar);
  }

  //METODO PARA CARREGAR EVATRA DO USUARIO
  Future loadAvata({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  ///METODO RESPONSSAVEL POR SALVAR A LISTA DE EVENTOS:
  Future<List<String>> loadList({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var listResult = prefs.getStringList(key);
    return listResult ?? [];
  }

  ///METODO RESPONSSAVEL POR DELETAR A LISTA DE EVENTOS:
  /// Passando o KEY anes ultilizada no metodo de salvar.
  Future deletList({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  ///METODO PARA SALVAR USER NAME
  setUserName({required String nameUser, required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, nameUser);
  }

  /// METODO PARA SALVAR USER MONEY
  setUserMoney({required String moneyUser, required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, moneyUser);
  }

  ///PERCORRRER OS INTEM DA LISTA CONVERTENDO sTRINGJSON EM OBJECT MODL
  Future<List<Evento>> getListEventos({required String key}) async {
    List<Evento> eventos = [];
    listString = await loadList(key: key);
    for (var i in listString) {
      var event = jsonDecode(i);
      var item = Evento.fromMap(event);
      eventos.add(item);
    }
    return eventos;
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

  /// EDITA O CONTATO EXISTENTE
  Future editingEvnetList(
      {required String key, required int index, required Evento evento}) async {
    List<String>? listStrng = [];
    loadList(key: key).then((v) {
      listStrng = v;
      listStrng!.insert(index, evento.toJson());
      listStrng!.removeAt(index + 1);
      saveList(key: key, list: listStrng);
    });
  }

  ///Carregar Name do usuario
  Future getNameUser({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var name = prefs.getString(key);
    return name;
  }

  ///Carregar Money do usuario
  Future getMoneyUser({required String key}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var money = prefs.getString(key);
    return money;
  }
}

const String keyList = '@evento';
const String keyUsername = '@user';
const String keyUserMoney = '@Money';
const String keyUserAvatar = '@Avatar';
const String tempavatar = '@TempAvatar';
//chave da lista 'evento1'

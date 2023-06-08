// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:shared_preferences/shared_preferences.dart';

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
    var usernme = await SharedPrefs.prefs.getStringList(key);
    return usernme;
  }
}
//'evento1'
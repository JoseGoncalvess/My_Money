import 'dart:developer';
import 'package:flutter/material.dart';

import '../../../model/shared_preferences.dart';

class UserController extends ValueNotifier<bool> {
  final SharedPrefs prefs = SharedPrefs();

  UserController() : super(false);

  Future setuser({required String nameUser, required String moneyUser}) async {
    prefs.setUserName(nameUser: nameUser, key: keyUsername);
    prefs.setUserMoney(moneyUser: moneyUser, key: keyUserMoney);
    log('User Salvo com sucesso');
  }

  lodUser({required String key}) async {
    prefs.getNameUser(key: key).then((v) => {
          if (v != '' && v != null) {value = true}
        });
  }
}

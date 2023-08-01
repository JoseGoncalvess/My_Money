import 'package:flutter/material.dart';

import '../../../../model/shared_preferences.dart';

class AvatarSelectController extends ValueNotifier<String> {
  AvatarSelectController() : super('assets/img/sem_logo.jpg');
  SharedPrefs prefs = SharedPrefs();

  setAvtar({required String avatar, required String key}) {
    value = avatar;
    prefs.saveAvata(key: key, avatar: avatar);
  }

  chekingAVtar({required String key}) async {
    value = await prefs.loadAvata(key: key) ?? value;
  }
}

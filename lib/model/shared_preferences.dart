// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences prefs;

  Future<SharedPreferences> init() async {
    return prefs = await SharedPreferences.getInstance();
  }
}

Future savename() async {
  await SharedPrefs.prefs.setString('name', 'boyzinho');
}

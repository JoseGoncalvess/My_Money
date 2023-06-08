import 'package:flutter/material.dart';
import 'package:my_money/page/app_widegt.dart';

import 'model/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPrefs().init;

  runApp(const AppWidegt());
}

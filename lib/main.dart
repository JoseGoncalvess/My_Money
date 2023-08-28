import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_money/view/app_widegt.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  RendererBinding.instance.semanticsEnabled;
  runApp(const AppWidegt());
}

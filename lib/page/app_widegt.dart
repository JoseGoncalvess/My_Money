import 'package:flutter/material.dart';
import 'package:my_money/page/page_text.dart';
import 'package:my_money/page/screens/splash/splash_page.dart';

class AppWidegt extends StatefulWidget {
  const AppWidegt({Key? key}) : super(key: key);

  @override
  State<AppWidegt> createState() => _AppWidegtState();
}

class _AppWidegtState extends State<AppWidegt> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'My Money',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Fredoka',
          colorScheme: const ColorScheme.dark(onPrimary: Color(0xff4F4D8C)),

          // useMaterial3: true,
        ),
        home: PageText());
  }
}

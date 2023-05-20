import 'package:flutter/material.dart';

class LogoInlineWidget extends StatefulWidget {
  final double fontsiz;
  final double imagescale;

  const LogoInlineWidget(
      {Key? key, required this.fontsiz, required this.imagescale})
      : super(key: key);

  @override
  State<LogoInlineWidget> createState() => _LogoInlineWidgetState();
}

class _LogoInlineWidgetState extends State<LogoInlineWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 3.0, bottom: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/img/logo.png',
            scale: widget.imagescale,
          ),
          Text(
            'My Money',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: height * widget.fontsiz,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

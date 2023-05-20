import 'package:flutter/material.dart';

class ButtomCustomWidget extends StatelessWidget {
  final Function onpressed;
  final String name;
  final Color colortext;
  final Color backgroud;

  const ButtomCustomWidget(
      {Key? key,
      required this.onpressed,
      required this.name,
      required this.colortext,
      required this.backgroud})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(backgroud)),
      onPressed: onpressed(),
      child: Text(name,
          style: TextStyle(
              color: colortext,
              fontSize: height * 0.038,
              fontWeight: FontWeight.w600)),
    );
  }
}

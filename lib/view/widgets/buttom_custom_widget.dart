import 'package:flutter/material.dart';

class ButtomCustomWidget extends StatefulWidget {
  final Function() onpressed;
  final String name;
  final Color colortext;
  final Color backgroud;
  final double largura;
  final double altura;

  const ButtomCustomWidget(
      {Key? key,
      required this.onpressed,
      required this.name,
      required this.colortext,
      required this.backgroud,
      required this.largura,
      required this.altura})
      : super(key: key);

  @override
  State<ButtomCustomWidget> createState() => _ButtomCustomWidgetState();
}

class _ButtomCustomWidgetState extends State<ButtomCustomWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(2, 4),
                blurStyle: BlurStyle.solid,
              )
            ]),
        width: width * widget.largura,
        height: height * widget.altura,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(widget.backgroud)),
          onPressed: widget.onpressed,
          child: Text(widget.name,
              style: TextStyle(
                  color: widget.colortext,
                  fontSize: height * 0.038,
                  fontWeight: FontWeight.w600)),
        ),
      ),
    );
  }
}

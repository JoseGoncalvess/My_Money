import 'package:flutter/material.dart';

class ButtomCustomWidget extends StatefulWidget {
  final Function() onpressed;
  final String name;
  final Color colortext;
  final Color backgroud;
  final double largura;
  final double altura;

  const ButtomCustomWidget(
      {super.key,
      required this.onpressed,
      required this.name,
      required this.colortext,
      required this.backgroud,
      required this.largura,
      required this.altura});

  @override
  State<ButtomCustomWidget> createState() => _ButtomCustomWidgetState();
}

class _ButtomCustomWidgetState extends State<ButtomCustomWidget> {
  bool press = false;
  void animatio() {
    setState(() {
      press = true;
      Future.delayed(const Duration(milliseconds: 190)).then((value) => {
            setState(
              () => press = false,
            ),
            widget.onpressed()
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(widget.backgroud)),
        onPressed: () => animatio(),
        child: Text(widget.name,
            style: TextStyle(
                color: widget.colortext,
                fontSize: MediaQuery.of(context).size.height * 0.038,
                fontWeight: FontWeight.w600)),
      ),
    );
  }
}

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
  bool press = false;
  animatio() {
    setState(() {
      press = true;
      Future.delayed(const Duration(milliseconds: 200)).then((value) => {
            setState(
              () => press = false,
            )
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.bounceIn,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: !press ? const Offset(2, 4) : const Offset(2, 0),
                blurStyle: BlurStyle.solid,
              )
            ]),
        width: width * widget.largura,
        height: height * widget.altura,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(widget.backgroud)),
          onPressed: () {
            widget.onpressed();
            animatio();
          },
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

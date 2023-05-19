import 'package:flutter/material.dart';

class EventoPage extends StatelessWidget {
  const EventoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height,
      color: const Color(0xFF2E4159),
      child: Stack(children: [
        Container(
          color: Colors.red,
          height: height * 0.2,
          width: width,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(
            width: width,
            height: height * 0.8,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(60),
                    topRight: Radius.circular(60))),
          ),
        ]),
      ]),
    );
  }
}

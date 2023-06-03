import 'package:flutter/material.dart';

class CardEventListWidget extends StatefulWidget {
  const CardEventListWidget({Key? key}) : super(key: key);

  @override
  State<CardEventListWidget> createState() => _CardEventListWidgetState();
}

class _CardEventListWidgetState extends State<CardEventListWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: width * 0.8,
        height: height * 0.12,
        decoration: const BoxDecoration(
            color: Color(0xFF2E4159),
            borderRadius: BorderRadius.all(Radius.circular(22)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.5,
                  color: const Color.fromARGB(193, 0, 0, 0),
                  blurRadius: 1,
                  blurStyle: BlurStyle.normal,
                  offset: Offset(1, 5))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: width * 0.2,
                height: height * 0.1,
                decoration: BoxDecoration(
                  color: Color(0xff5F5DA6),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  Icons.work,
                  size: width * 0.09,
                  color: const Color(0xFFEBE9E9),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    'Pc Gamer',
                    style: TextStyle(
                        fontSize: height * 0.023, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                Text(
                  '24/05/2023',
                  style: TextStyle(
                      fontSize: height * 0.017, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Text(
              'R\$ 200,00',
              style: TextStyle(
                  fontSize: height * 0.02, fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
  }
}

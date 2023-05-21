import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  bool opendor = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5F5DA6),
        title: const Text('Perguntas Frequentes'),
      ),
      body: Container(
        width: width,
        height: height,
        color: Color(0xFF2E4159),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          opendor = !opendor;
                        });
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: const Color(0xff5F5DA6),
                            borderRadius: BorderRadius.only(
                                topLeft: const Radius.circular(12),
                                topRight: const Radius.circular(12),
                                bottomLeft: Radius.circular(opendor ? 12 : 0),
                                bottomRight:
                                    Radius.circular(opendor ? 12 : 0))),
                        child: Text(
                          'Tem algum perigo este app?',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: width * 0.05),
                        ),
                        width: width * 0.9,
                        height: height * 0.06,
                      ),
                    ),
                    AnimatedContainer(
                      alignment: Alignment.center,
                      duration: const Duration(seconds: 1),
                      curve: Curves.ease,
                      width: width * 0.9,
                      height: opendor ? 0 : height * 0.2,
                      color: Colors.red,
                      child: Text(
                          'não este app foi desnevolvido com o intuito de ajudar você a ter total controle da tua vida financeira'),
                    )
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../eventopage/evento_page.dart';

class ResumeCardWidget extends StatefulWidget {
  final String saldoucont;
  final String dispesas;
  const ResumeCardWidget(
      {Key? key, required this.saldoucont, required this.dispesas})
      : super(key: key);

  @override
  State<ResumeCardWidget> createState() => _ResumeCardWidgetState();
}

class _ResumeCardWidgetState extends State<ResumeCardWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Positioned(
        top: 60,
        right: 50,
        left: 50,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(22)),
          width: width * 0.6,
          height: height * 0.2,
          child: Column(
            children: [
              SizedBox(
                width: width * 0.78,
                height: height * 0.1,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Saldo em Conta:',
                          style: TextStyle(
                              color: const Color(0xff5F5DA6),
                              fontWeight: FontWeight.w700,
                              fontSize: height * 0.022),
                        ),
                        Text(
                          'R\$ ${widget.saldoucont}',
                          style: TextStyle(
                              color: const Color(0xff5F5DA6),
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.019),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Despesas:',
                          style: TextStyle(
                              color: const Color(0xff5F5DA6),
                              fontWeight: FontWeight.w600,
                              fontSize: height * 0.022),
                        ),
                        Text(
                          'R\$ ${widget.dispesas}',
                          style: TextStyle(
                              color: const Color(0xff5F5DA6),
                              fontWeight: FontWeight.w500,
                              fontSize: height * 0.019),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                '- - - - - - - - - - - - - - - -',
                style: TextStyle(
                    color: const Color(0xff5F5DA6),
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.03),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Novo Evento ',
                    style: TextStyle(
                        color: const Color(0xff5F5DA6),
                        fontWeight: FontWeight.bold,
                        fontSize: height * 0.02),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EventoPage(),
                            ));
                      },
                      icon: const Icon(
                        Icons.add_circle_rounded,
                        color: Color(0xff5F5DA6),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}

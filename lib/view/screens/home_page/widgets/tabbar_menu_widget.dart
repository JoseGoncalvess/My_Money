import 'dart:developer';

import 'package:flutter/material.dart';

import '../../page_details/dtails_page.dart';

class TabbarMenuWidget extends StatefulWidget {
  final String money;
  const TabbarMenuWidget({
    Key? key,
    required this.money,
  }) : super(key: key);

  @override
  State<TabbarMenuWidget> createState() => _TabbarMenuWidgetState();
}

class _TabbarMenuWidgetState extends State<TabbarMenuWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.15,
      width: width,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 80, 78, 140),
              offset: Offset(0, 2),
              blurRadius: 20,
              blurStyle: BlurStyle.normal,
              spreadRadius: 1)
        ],
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        color: Color(0xff4F4D8C),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              log('pega kraiii');
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu_rounded,
              size: height * 0.05,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: SizedBox(
              height: height * 0.12,
              width: width * 0.35,
              // color: Colors.amberAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.06,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                            image: AssetImage('assets/img/sem_logo.jpg'))),
                  ),
                  Text(
                    'Saldo em Conta',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: height * 0.02),
                  ),
                  Text(
                    'R\$ ${widget.money}',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: height * 0.02),
                  )
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DtailsPage(),
                    ));
              },
              icon: Icon(
                Icons.receipt_long_rounded,
                size: height * 0.05,
              ))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class TabbarMenuWidget extends StatelessWidget {
  const TabbarMenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Container(
      height: height * 0.15,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        color: Color(0xff4F4D8C),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu_rounded,
              size: height * 0.05,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Container(
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
                    '\$R 2000',
                    style: TextStyle(
                        fontWeight: FontWeight.w700, fontSize: height * 0.02),
                  )
                ],
              ),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.receipt_long_rounded,
                size: height * 0.05,
              ))
        ],
      ),
    );
  }
}

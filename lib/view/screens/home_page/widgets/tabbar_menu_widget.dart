import 'package:flutter/material.dart';
import 'package:my_money/controller/helprs/formaters/formater_value_payment.dart';
import '../../page_details/dtails_page.dart';

class TabbarMenuWidget extends StatefulWidget {
  final String money;
  final String perfil;
  const TabbarMenuWidget({
    super.key,
    required this.money,
    required this.perfil,
  });

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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(
              Icons.menu_rounded,
              size: height * 0.05,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              height: height * 0.12,
              width: width * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width * 0.06,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image:
                            DecorationImage(image: AssetImage(widget.perfil))),
                  ),
                  Text(
                    'Saldo em Conta',
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: height * 0.02),
                  ),
                  Text(
                    FormaterValuePayment()
                        .viewValue(value: double.parse(widget.money)),
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

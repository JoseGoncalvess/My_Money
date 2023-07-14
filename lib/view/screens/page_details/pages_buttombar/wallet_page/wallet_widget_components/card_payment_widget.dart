import 'package:flutter/material.dart';

class CardPaymentWidget extends StatelessWidget {
  final String namepayment;
  final String value;
  final String eventnumber;
  final IconData icon;
  const CardPaymentWidget(
      {Key? key,
      required this.namepayment,
      required this.value,
      required this.eventnumber,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.23,
      height: height * 0.13,
      decoration: BoxDecoration(
          color: const Color(0xFF2E4159),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: width * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(
                  namepayment,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.022),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'R\$ $value',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.018),
              ),
              Text(
                'Transações: $eventnumber',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.019),
              )
            ],
          ),
        ],
      ),
    );
  }
}

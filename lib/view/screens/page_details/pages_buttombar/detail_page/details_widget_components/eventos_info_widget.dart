import 'package:flutter/material.dart';

class EventosInfoWidget extends StatelessWidget {
  final String namepayment;
  final String value;
  final String eventnumber;
  final IconData icon;
  final double w;
  final double h;

  const EventosInfoWidget(
      {Key? key,
      required this.namepayment,
      required this.value,
      required this.eventnumber,
      required this.icon,
      required this.w,
      required this.h})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * w,
      height: height * h,
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
                size: width * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  namepayment,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: height * 0.03),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                value,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.03),
              ),
              Text(
                'Transações: $eventnumber',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.02),
              )
            ],
          ),
        ],
      ),
    );
  }
}

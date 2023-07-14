import 'package:flutter/material.dart';

class CardInfoWidget extends StatelessWidget {
  final String nameinfo;
  final String valueinfo;
  final IconData icon;
  const CardInfoWidget(
      {Key? key,
      required this.nameinfo,
      required this.valueinfo,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.45,
      height: height * 0.14,
      decoration: BoxDecoration(
          color: Color(0xFFA40D05), borderRadius: BorderRadius.circular(12)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            size: height * 0.05,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                nameinfo,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: height * 0.04),
              ),
              Text(
                'R\$ $valueinfo',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.03),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//color green
//Color(0xFF05A41A)

//color loser
//Color(0xFFA40D05)

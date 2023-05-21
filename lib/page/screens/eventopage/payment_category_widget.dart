import 'package:flutter/material.dart';

class PaymentCategoryWidget extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function() onpressed;
  const PaymentCategoryWidget(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: height * 0.08,
            width: width * 0.16,
            decoration: BoxDecoration(
                color: const Color(0xFF2E4159),
                borderRadius: BorderRadius.circular(100)),
            child: IconButton(
                onPressed: onpressed,
                icon: Icon(
                  icon,
                  size: width * 0.1,
                )),
          ),
          Text(name,
              style: TextStyle(
                  color: const Color(0xFF2E4159),
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class PaymentCategoryWidget extends StatefulWidget {
  final String name;
  final Color color;
  final IconData icon;
  final Function() onpressed;
  const PaymentCategoryWidget(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onpressed,
      required this.color})
      : super(key: key);

  @override
  State<PaymentCategoryWidget> createState() => _PaymentCategoryWidgetState();
}

class _PaymentCategoryWidgetState extends State<PaymentCategoryWidget> {
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
                color: widget.color, borderRadius: BorderRadius.circular(100)),
            child: IconButton(
                onPressed: widget.onpressed,
                icon: Icon(
                  widget.icon,
                  size: width * 0.1,
                )),
          ),
          Text(widget.name,
              style: TextStyle(
                  color: const Color(0xFF2E4159),
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}

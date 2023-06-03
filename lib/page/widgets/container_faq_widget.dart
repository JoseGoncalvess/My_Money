import 'dart:developer';

import 'package:flutter/material.dart';

class ContainerFaqWidget extends StatefulWidget {
  final bool onselect;
  final Function() onpressed;

  final String doubt;
  final String ress;
  const ContainerFaqWidget({
    Key? key,
    required this.onselect,
    required this.onpressed,
    required this.doubt,
    required this.ress,
  }) : super(key: key);

  @override
  State<ContainerFaqWidget> createState() => _ContainerFaqWidgetState();
}

class _ContainerFaqWidgetState extends State<ContainerFaqWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: widget.onpressed,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xff5F5DA6),
                  borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(12),
                      topRight: const Radius.circular(12),
                      bottomLeft: Radius.circular(widget.onselect ? 0 : 12),
                      bottomRight: Radius.circular(widget.onselect ? 0 : 12))),
              width: width * 0.9,
              height: height * 0.08,
              child: Text(
                widget.doubt,
                style: TextStyle(
                    fontWeight: FontWeight.w600, fontSize: width * 0.05),
              ),
            ),
          ),
          AnimatedContainer(
            alignment: Alignment.center,
            duration: const Duration(seconds: 1),
            curve: Curves.ease,
            width: width * 0.9,
            height: widget.onselect ? height * 0.3 : 0,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(widget.onselect ? 12 : 0),
                    bottomRight: Radius.circular(widget.onselect ? 12 : 0))),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                widget.ress,
                style: TextStyle(
                    color: Color(0xff5F5DA6),
                    fontWeight: FontWeight.w500,
                    fontSize: width * 0.05),
              ),
            ),
          )
        ],
      ),
    );
  }
}

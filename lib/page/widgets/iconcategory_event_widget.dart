import 'package:flutter/material.dart';

class IconcategoryEventWidget extends StatefulWidget {
  final IconData icon;

  final Function() onpressed;
  final String namecategory;
  final onselectd;

  const IconcategoryEventWidget({
    Key? key,
    required this.icon,
    required this.namecategory,
    required this.onpressed,
    required this.onselectd,
  }) : super(key: key);

  @override
  State<IconcategoryEventWidget> createState() =>
      _IconcategoryEventWidgetState();
}

class _IconcategoryEventWidgetState extends State<IconcategoryEventWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return AnimatedContainer(
      margin: const EdgeInsets.only(top: 30),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutSine,
      child: Column(
        children: [
          Container(
            width: width * 0.23,
            height: height * 0.115,
            decoration: BoxDecoration(
              color: widget.onselectd
                  ? const Color(0xFF2E4159)
                  : const Color(0xff4F4D8C),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
                onPressed: widget.onpressed,
                icon: Icon(
                  widget.icon,
                  size: width * 0.14,
                )),
          ),
          Text(widget.namecategory,
              style: TextStyle(
                  color: const Color(0xff5F5DA6),
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}

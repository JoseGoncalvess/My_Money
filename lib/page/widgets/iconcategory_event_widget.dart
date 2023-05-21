import 'package:flutter/material.dart';

class IconcategoryEventWidget extends StatelessWidget {
  final IconData icon;
  final Function() onpressed;
  final String namecategory;

  const IconcategoryEventWidget(
      {Key? key,
      required this.icon,
      required this.namecategory,
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
            width: width * 0.23,
            height: height * 0.115,
            decoration: BoxDecoration(
              color: const Color(0xFF2E4159),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
                onPressed: onpressed,
                icon: Icon(
                  icon,
                  size: width * 0.14,
                )),
          ),
          Text(namecategory,
              style: TextStyle(
                  color: const Color(0xff5F5DA6),
                  fontSize: width * 0.05,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}

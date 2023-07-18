import 'package:flutter/material.dart';

class NewItemWidget extends StatelessWidget {
  final String mensseger;
  final Color colortext;
  final Color coloricon;
  const NewItemWidget(
      {Key? key,
      required this.mensseger,
      required this.colortext,
      required this.coloricon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.note_add_rounded,
          size: 130,
          color: coloricon,
        ),
        Text(mensseger,
            style: TextStyle(
                color: colortext,
                fontWeight: FontWeight.bold,
                fontSize: height * 0.03))
      ],
    );
  }
}
// const Color(0xff5F5DA6)


//  Color(0xFF2E4159)
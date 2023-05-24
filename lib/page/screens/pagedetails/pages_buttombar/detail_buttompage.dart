import 'package:flutter/material.dart';

class DetailButtompage extends StatelessWidget {
  const DetailButtompage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
      ),
    );
  }
}

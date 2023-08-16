import 'package:flutter/material.dart';

class LoadWidget extends StatelessWidget {
  final String comunic;
  const LoadWidget({super.key, required this.comunic});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      width: width,
      height: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            comunic,
            style: TextStyle(
                fontSize: width * 0.06,
                color: Colors.grey,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          const CircularProgressIndicator(
            color: Color(0xff4F4D8C),
          )
        ],
      ),
    );
  }
}

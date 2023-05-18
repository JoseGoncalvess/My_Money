import 'package:flutter/material.dart';

class AvatarProfileWidget extends StatelessWidget {
  final String image;
  const AvatarProfileWidget({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width * 0.1,
        height: height * 0.1,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(image: AssetImage(image))),
      ),
    );
  }
}

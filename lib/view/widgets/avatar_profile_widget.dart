import 'package:flutter/material.dart';

class AvatarProfileWidget extends StatelessWidget {
  const AvatarProfileWidget({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      width: width * 0.2,
      height: height * 0.2,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.contain,
            image: AssetImage(image),
          )),
    );
  }
}

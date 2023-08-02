import 'package:flutter/material.dart';

class AvatarSelect extends StatefulWidget {
  const AvatarSelect({super.key, required this.state, required this.img});
  final bool state;
  final String img;

  @override
  State<AvatarSelect> createState() => _AvatarSelectState();
}

class _AvatarSelectState extends State<AvatarSelect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          image: DecorationImage(
            image: AssetImage(widget.img),
            fit: BoxFit.cover,
          )),
    );
  }
}

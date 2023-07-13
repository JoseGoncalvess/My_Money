import 'package:flutter/material.dart';

class CardAvatarSelectWidget extends StatefulWidget {
  final bool onselect;
  final String image;
  const CardAvatarSelectWidget(
      {super.key, required this.onselect, required this.image});

  @override
  State<CardAvatarSelectWidget> createState() => _CardAvatarSelectWidgetState();
}

class _CardAvatarSelectWidgetState extends State<CardAvatarSelectWidget> {
  @override
  Widget build(BuildContext context) {
    final top = widget.onselect ? 50.0 : 80.0;
    final bottom = widget.onselect ? 10.0 : 60.0;
    final opacyt = widget.onselect ? 1.0 : 0.3;

    return AnimatedContainer(
      curve: Curves.easeInOut,
      margin: EdgeInsets.only(top: top, right: 30, left: 10, bottom: bottom),
      duration: const Duration(milliseconds: 500),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          image: DecorationImage(
              image: AssetImage(widget.image),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              opacity: opacyt)),
    );
  }
}

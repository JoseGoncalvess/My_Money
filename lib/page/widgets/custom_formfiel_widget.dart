import 'package:flutter/material.dart';

class CustomFormfielWidget extends StatefulWidget {
  final String internlabel;
  final TextInputType keybordtype;
  final TextEditingController controller;

  const CustomFormfielWidget(
      {Key? key,
      required this.internlabel,
      required this.keybordtype,
      required this.controller})
      : super(key: key);

  @override
  State<CustomFormfielWidget> createState() => _CustomFormfielWidgetState();
}

class _CustomFormfielWidgetState extends State<CustomFormfielWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          color: Color(0xff4F4D8C),
          decorationThickness: 0.0,
          fontWeight: FontWeight.w600),
      controller: widget.controller,
      textAlign: TextAlign.center,
      keyboardType: widget.keybordtype,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff4F4D8C), width: 2)),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            width: 2,
            color: Color(0xff4F4D8C),
          ),
        ),
        hintText: widget.internlabel,
        hintStyle: TextStyle(
          color: const Color(0xFF5F5DA6).withOpacity(0.6),
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
      ),
    );
  }
}

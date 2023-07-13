import 'package:flutter/material.dart';

import '../../controller/mixins/validador_mixin.dart';

class CustomFormfielWidget extends StatefulWidget {
  final String internlabel;
  final TextInputType keybordtype;
  final TextEditingController controller;
  final Color cortext;
  final Color backgrou;
  final Color border;

  const CustomFormfielWidget({
    Key? key,
    required this.internlabel,
    required this.keybordtype,
    required this.controller,
    required this.cortext,
    required this.backgrou,
    required this.border,
  }) : super(key: key);

  @override
  State<CustomFormfielWidget> createState() => _CustomFormfielWidgetState();
}

class _CustomFormfielWidgetState extends State<CustomFormfielWidget>
    with ValidadorMixin {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) => combvalidator(validator: [
        () => isempyt(value: value, msg: 'Ops, Não deixe o campo vazio!'),
        () => islengthMin(value, 'Vamos lá um pouco maior!', 3),
      ]),
      style: TextStyle(
          color: widget.cortext,
          decorationThickness: 0.0,
          fontWeight: FontWeight.w600),
      controller: widget.controller,
      textAlign: TextAlign.center,
      keyboardType: widget.keybordtype,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(color: widget.border, width: 2)),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            width: 2,
            color: widget.border,
          ),
        ),
        hintText: widget.internlabel,
        hintStyle: TextStyle(
          color: widget.cortext,
          fontWeight: FontWeight.bold,
        ),
        filled: true,
        fillColor: widget.backgrou,
      ),
    );
  }
}

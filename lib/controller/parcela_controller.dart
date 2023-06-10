import 'package:flutter/material.dart';

class ParcelaController extends ValueNotifier<int> {
  ParcelaController() : super(1);

  setValue(int index, BuildContext context) {
    value = index;
    Navigator.pop(context);
  }
}

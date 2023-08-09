import 'package:flutter/material.dart';

class ParcelaController extends ValueNotifier<int> {
  ParcelaController() : super(1);

  setValue(int index, BuildContext context) {
    value = index;
    Navigator.pop(context);
  }

  Future<bool> initvalue(
      {required String payment, required String numParcel}) async {
    if (payment == "Cartão") {
      value = int.parse(numParcel);
      return true;
    } else {
      return false;
    }
  }
}

import 'dart:developer';
import 'package:intl/intl.dart';

class FormaterValuePayment {
  //TARATMENO DA DO FORMATOR DO VALO DE ENTRADA PARA DOUBLE
  String formatDouble({required String value}) {
    late String newDouble;
    if (value.contains(',') && value.substring(0, 3).contains(".")) {
      String cents = value.replaceAll(",", ".");
      newDouble = cents.replaceFirst(".", '');
      log("O VALOR EM DOUBLE -> $newDouble");
    } else if (!value.contains(",")) {
      newDouble = value.replaceFirst(".", '');
      log(newDouble);
    } else if (!value.substring(0, 3).contains(".") && value.contains(',')) {
      String cents = value.replaceAll(",", ".");
      newDouble = cents;
    }

    return newDouble;
  }

//APRESENTAÇÃODO VALOR EM REAL BR
  String viewValue({required double value}) {
    late String currency;
    try {
      currency =
          NumberFormat.currency(locale: "pt_br", symbol: "R\$").format(value);
      log(currency);
    } catch (e) {
      log(e.toString());
    }
    return currency;
  }
}

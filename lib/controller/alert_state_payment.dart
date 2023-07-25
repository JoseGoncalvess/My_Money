import 'package:flutter/material.dart';

class AlertStatePayment {
  Color statePayment(String stage) {
    switch (stage) {
      case "1":
        return const Color(0xFF268D29);
      case "2":
        return const Color(0xFFECD821);
      case "3":
        return const Color(0xFFA40D05);
    }
    return Colors.green;
  }
}

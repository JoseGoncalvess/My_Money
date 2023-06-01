import 'package:flutter/material.dart';

class InterfaceData {
  List<Map> categoryIcons = [
    {'id': 0, 'name': 'Ferias', IconData: Icons.luggage_rounded},
    {'id': 1, 'name': 'Lazer', IconData: Icons.park_rounded},
    {'id': 2, 'name': 'Investimento', IconData: Icons.auto_graph_rounded},
    {'id': 0, 'name': 'Viagem', IconData: Icons.flight_rounded},
    {'id': 0, 'name': 'Saúde', IconData: Icons.medical_services_rounded},
    {'id': 0, 'name': 'Alimentação', IconData: Icons.restaurant_rounded},
    {'id': 0, 'name': 'Trabalho', IconData: Icons.work},
  ];

  List<Map> paymentIcons = [
    {
      'id': 0,
      'name': 'Cartão',
      IconData: Icons.credit_card_rounded,
    },
    {
      'id': 1,
      'name': 'Dinehiro',
      IconData: Icons.payments_rounded,
    },
  ];
}

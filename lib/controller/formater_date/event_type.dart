import 'package:flutter/material.dart';

class EventType {
  String getEvent({required IconData icon}) {
    switch (icon) {
      case Icons.luggage_rounded:
        return 'Ferias';
      case Icons.park_rounded:
        return 'Lazer';
      case Icons.auto_graph_rounded:
        return 'Investimento';
      case Icons.flight_rounded:
        return 'Viagem';
      case Icons.medical_services_rounded:
        return 'Saúde';
      case Icons.work:
        return 'Trabalho';
      case Icons.fastfood_rounded:
        return 'Lanche';
      case Icons.assistant_rounded:
        return 'Outros';
    }
    return 'Evento';
  }
}

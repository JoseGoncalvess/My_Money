import 'package:flutter/material.dart';

import '../../model/evento_model.dart';

class RepositoryData {
  List<Evento> listEventos = [];

  Future onSaveEvent({
    required String nameEvent,
    required String dateEvent,
    required String velueEvent,
    required IconData categoryEvent,
    required String paymentEvent,
    required String? parcelEvnet,
  }) async {
    listEventos.add(Evento(
        nameEvent: nameEvent,
        dateEvent: dateEvent,
        velueEvent: velueEvent,
        categoryEvent: categoryEvent,
        paymentEvent: paymentEvent));

    return listEventos;
  }
}

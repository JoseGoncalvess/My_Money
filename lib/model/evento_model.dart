// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Evento {
  final String nameEvent;
  final String dateEvent;
  final String velueEvent;
  final IconData categoryEvent;
  final String paymentEvent;
  final String? parcelEvnet;
  Evento({
    required this.nameEvent,
    required this.dateEvent,
    required this.velueEvent,
    required this.categoryEvent,
    required this.paymentEvent,
    required this.parcelEvnet,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nameEvent': nameEvent,
      'dateEvent': dateEvent,
      'velueEvent': velueEvent,
      'categoryEvent': categoryEvent.codePoint,
      'paymentEvent': paymentEvent,
      'parcelEvnet': parcelEvnet,
    };
  }

  factory Evento.fromMap(Map<String, dynamic> map) {
    return Evento(
      nameEvent: map['nameEvent'] as String,
      dateEvent: map['dateEvent'] as String,
      velueEvent: map['velueEvent'] as String,
      categoryEvent:
          IconData(map['categoryEvent'] as int, fontFamily: 'MaterialIcons'),
      paymentEvent: map['paymentEvent'] as String,
      parcelEvnet:
          map['parcelEvnet'] != null ? map['parcelEvnet'] as String : null,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Evento.fromJson(String source) =>
      Evento.fromMap(json.decode(source) as Map<String, dynamic>);
}

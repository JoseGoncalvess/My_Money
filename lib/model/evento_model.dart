// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class EventoModel {
  final String nameEvent;
  final String dateEvent;
  final String velueEvent;
  final IconData categoryEvent;
  final String paymentEvent;
  final String? parcelEvnet;
  EventoModel({
    required this.nameEvent,
    required this.dateEvent,
    required this.velueEvent,
    required this.categoryEvent,
    required this.paymentEvent,
    this.parcelEvnet,
  });
}

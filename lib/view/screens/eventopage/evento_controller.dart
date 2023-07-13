import 'package:flutter/material.dart';

import '../../../controller/formater_date/formater_date.dart';

class EventoController extends ValueNotifier<String> {
  FormaterDate data = FormaterDate();
  //

  EventoController() : super('Data do Evento...');
  final open = ValueNotifier<bool>(false);

  //
  openBox({required BuildContext context}) async {
    showDialog(
      context: context,
      builder: (context) => DatePickerDialog(
        initialCalendarMode: DatePickerMode.day,
        lastDate: DateTime(2035),
        firstDate: DateTime(2000),
        initialDate: DateTime(2023),
        initialEntryMode: DatePickerEntryMode.calendar,
      ),
    ).then((date) => {
          if (date != null) {value = data.fdata(dataTme: date.toString())}
        });
  }
}

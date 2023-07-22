import 'package:flutter/material.dart';
import '../../../controller/formater_date/formater_date.dart';

class EventoController extends ValueNotifier<String> {
  FormaterDate data = FormaterDate();
  //
  EventoController() : super('Data do Evento...');
  final newdate = ValueNotifier<String>('');
  final open = ValueNotifier<bool>(false);

  //
  Future openBox({required BuildContext context}) async {
    return showDialog(
      context: context,
      builder: (context) => DatePickerDialog(
        initialCalendarMode: DatePickerMode.day,
        lastDate: DateTime(2035),
        firstDate: DateTime(2000),
        initialDate: DateTime.now(),
        initialEntryMode: DatePickerEntryMode.calendar,
      ),
    ).then((date) => {
          if (date != null)
            {
              setdate(date: date.toString()),
            }
        });
  }

  setdate({required String date}) {
    newdate.value = data.fdata(dataTme: date.toString());
    value;

    value = data.fdata(dataTme: date.toString());
  }
}

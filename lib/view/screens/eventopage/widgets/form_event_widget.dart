import 'package:flutter/material.dart';
import 'package:my_money/controller/mixins/validador_mixin.dart';
import 'package:my_money/view/screens/eventopage/widgets/row_infoform_widget.dart';

import 'category_event_widget.dart';

class FormEventWidget extends StatefulWidget {
  final PageController pagecontrollerCat;
  final TextEditingController eventocontroller;
  final TextEditingController valuecontroller;
  final Function()? timetable;
  final String datevalue;
  const FormEventWidget(
      {Key? key,
      required this.eventocontroller,
      required this.valuecontroller,
      required this.pagecontrollerCat,
      required this.timetable,
      required this.datevalue})
      : super(key: key);

  @override
  State<FormEventWidget> createState() => _FormEventWidgetState();
}

class _FormEventWidgetState extends State<FormEventWidget> with ValidadorMixin {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          width: width * 0.88,
          child: TextFormField(
            validator: (value) => combvalidator(validator: [
              () =>
                  isempyt(value: value, msg: 'Como Vamos chamer este Evento ?'),
              () => islengthMin(value, 'Vamos lá, você é bom com nomes !', 3),
              () => islengthMax(value, 'Que tal resumir, [12 caracteres] ?', 20)
            ]),
            style: const TextStyle(
                color: Colors.white,
                decorationThickness: 0.0,
                fontWeight: FontWeight.w600),
            controller: widget.eventocontroller,
            autocorrect: true,
            maxLines: 1,
            enableSuggestions: true,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2)),
              focusedBorder: UnderlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  width: 2,
                  color: Colors.white,
                ),
              ),
              hintText: 'Nome do Evento',
              hintStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              filled: true,
              fillColor: const Color(0xFF9090BA),
            ),
          ),
        ),
        RowInfoformWidget(
          datevalue: widget.datevalue,
          timeTble: widget.timetable,
          valorController: widget.valuecontroller,
        ),
        CategoryEventWidget(
          pagecontrollerCat: widget.pagecontrollerCat,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_money/controller/helprs/mixins/validador_mixin.dart';
import '../evento_controller.dart';

class RowInfoformWidget extends StatefulWidget {
  final Function? timeTble;
  final String datevalue;
  final TextEditingController valorController;
  const RowInfoformWidget(
      {Key? key,
      required this.valorController,
      required this.timeTble,
      required this.datevalue})
      : super(key: key);

  @override
  State<RowInfoformWidget> createState() => _RowInfoformWidgetState();
}

class _RowInfoformWidgetState extends State<RowInfoformWidget>
    with ValidadorMixin {
  final EventoController _eventocontroller = EventoController();
  @override
  void initState() {
    super.initState();
    _eventocontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.98,
      height: height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Data:',
                style: TextStyle(
                    color: const Color(0xFF2E4159),
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w700),
              ),
              InkWell(
                onTap: () {
                  widget.timeTble!();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: width * 0.4,
                  height: height * 0.074,
                  decoration: BoxDecoration(
                      color: const Color(0xFF9090BA),
                      borderRadius: BorderRadius.circular(4)),
                  child: Text(
                    widget.datevalue,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Valor:',
                style: TextStyle(
                    color: const Color(0xFF2E4159),
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.4,
                height: height * 0.08,
                child: TextFormField(
                  maxLines: 1,
                  autocorrect: true,
                  validator: (value) => combvalidator(validator: [
                    () => isempyt(value: value, msg: 'Realmente foi Gratís ?'),
                    () =>
                        islengthMin(value, 'Ops, Naõ vai infomra o valor ?', 1),
                    () => islengthMax(value, 'Nossa Quanto dinheiro !', 8)
                  ]),
                  style: const TextStyle(
                      color: Colors.white,
                      decorationThickness: 0.0,
                      fontWeight: FontWeight.w600),
                  controller: widget.valorController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
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
                    hintText: 'Valor',
                    hintStyle: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    filled: true,
                    fillColor: const Color(0xFF9090BA),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

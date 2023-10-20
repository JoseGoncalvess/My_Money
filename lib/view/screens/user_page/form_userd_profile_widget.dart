import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/controller/helprs/formaters/formater_value_payment.dart';
import '../../../controller/helprs/mixins/validador_mixin.dart';
import '../../widgets/buttom_custom_widget.dart';
import '../home_page/home_page.dart';
import 'user_controller.dart';

class FormUserdProfileWidget extends StatefulWidget {
  final String avatar;
  const FormUserdProfileWidget({
    Key? key,
    required this.avatar,
  }) : super(key: key);

  @override
  State<FormUserdProfileWidget> createState() => _FormUserdProfileWidgetState();
}

class _FormUserdProfileWidgetState extends State<FormUserdProfileWidget>
    with ValidadorMixin {
  final UserController _userController = UserController();
  final GlobalKey<FormState> _keyUser = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Form(
      key: _keyUser,
      child: Column(
        children: [
          SizedBox(
              width: width * 0.7,
              height: height * 0.12,
              child: Semantics(
                readOnly: true,
                label: "Digitar nome de usuario",
                child: TextFormField(
                  enableInteractiveSelection: false,
                  validator: (value) => combvalidator(
                    validator: [
                      () => isempyt(
                          msg: 'Ops, Como você se cham mesmo ?', value: value),
                      () =>
                          islengthMin(value, 'O que acha de um nome maior?', 2),
                      () => isContainNuber(
                          value, 'Permitido apenas Letras [A-Z].')
                    ],
                  ),
                  style: TextStyle(
                      color: const Color(0xff4F4D8C).withOpacity(0.6),
                      decorationThickness: 0.0,
                      fontWeight: FontWeight.w600),
                  controller: _nameController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(width: 2, color: Colors.white),
                      ),
                      hintText: 'Olá, Me chamo...',
                      hintStyle: TextStyle(
                        color: const Color(0xff4F4D8C).withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(
                          color: Colors.amber, fontSize: width * 0.032)),
                ),
              )),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
              width: width * 0.6,
              height: height * 0.1,
              child: Semantics(
                readOnly: true,
                label: "Digitar patrimonio do usuario",
                child: TextFormField(
                  enableInteractiveSelection: false,
                  validator: (value) => combvalidator(
                    validator: [
                      () => isempyt(
                          msg: 'Ops, Como você se cham mesmo ?', value: value),
                      () => islengthMax(
                          value, 'O que acha de um nome menor?', 10),
                      () => isContaintext(
                          value, 'Permitido apenas Números [0-9].')
                    ],
                  ),
                  style: TextStyle(
                      color: const Color(0xff4F4D8C).withOpacity(0.6),
                      decorationThickness: 0.0,
                      fontWeight: FontWeight.w600),
                  controller: _moneyController,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.white, width: 2)),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(width: 2, color: Colors.white),
                      ),
                      hintText: 'Meu patrimonio atual é ...',
                      hintStyle: TextStyle(
                        color: const Color(0xff4F4D8C).withOpacity(0.6),
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      errorStyle: TextStyle(
                          color: Colors.amber, fontSize: width * 0.032)),
                ),
              )),
          Semantics(
            label: "Salvar",
            button: true,
            child: ButtomCustomWidget(
                altura: 0.07,
                largura: 0.4,
                backgroud: const Color(0xff4F4D8C),
                colortext: Colors.white,
                name: 'Salvar',
                onpressed: () {
                  if (_keyUser.currentState!.validate()) {
                    _userController
                        .setuser(
                            avatar: widget.avatar,
                            nameUser: _nameController.text,
                            moneyUser: FormaterValuePayment()
                                .formatDouble(value: _moneyController.text))
                        .then(
                          (value) => Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          ),
                        );
                    log('${_nameController.text},${_moneyController.text}');
                  }
                }),
          )
        ],
      ),
    );
  }
}

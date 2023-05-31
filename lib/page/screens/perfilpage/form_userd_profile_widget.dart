import 'package:flutter/material.dart';
import '../../../controller/mixins/validador_mixin.dart';
import '../../widgets/buttom_custom_widget.dart';
import '../home/home_page.dart';

class FormUserdProfileWidget extends StatefulWidget {
  const FormUserdProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<FormUserdProfileWidget> createState() => _FormUserdProfileWidgetState();
}

class _FormUserdProfileWidgetState extends State<FormUserdProfileWidget>
    with ValidadorMixin {
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
              child: TextFormField(
                validator: (value) =>
                    isempyt(value, 'Ops, Como é mesmo seu Nome?'),
                style: TextStyle(
                    color: Color(0xff4F4D8C).withOpacity(0.6),
                    decorationThickness: 0.0,
                    fontWeight: FontWeight.w600),
                controller: _nameController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 2, color: Colors.white),
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
              )),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
              width: width * 0.6,
              height: height * 0.1,
              child: TextFormField(
                validator: (value) =>
                    isempyt(value, 'Ops, Faltou infomrar seu patrimonio!'),
                style: TextStyle(
                    color: Color(0xff4F4D8C).withOpacity(0.6),
                    decorationThickness: 0.0,
                    fontWeight: FontWeight.w600),
                controller: _moneyController,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white, width: 2)),
                    focusedBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(width: 2, color: Colors.white),
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
              )),
          ButtomCustomWidget(
              altura: 0.07,
              largura: 0.4,
              backgroud: const Color(0xff4F4D8C),
              colortext: Colors.white,
              name: 'Salvar',
              onpressed: () {
                // log(_keyUser.currentState!.validate().toString());
                if (_keyUser.currentState!.validate()) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ));
                }
              })
        ],
      ),
    );
  }
}

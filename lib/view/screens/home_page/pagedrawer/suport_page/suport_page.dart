import 'package:flutter/material.dart';
import 'package:my_money/controller/mixins/validador_mixin.dart';
import 'package:my_money/view/widgets/buttom_custom_widget.dart';
import 'package:my_money/view/widgets/custom_formfiel_widget.dart';

import 'suport_controller.dart';

class SuportPage extends StatefulWidget {
  const SuportPage({super.key});

  @override
  State<SuportPage> createState() => _SuportPageState();
}

class _SuportPageState extends State<SuportPage> with ValidadorMixin {
  final TextEditingController _corpoemail = TextEditingController();
  final TextEditingController _assuntoemail = TextEditingController();
  final GlobalKey<FormState> _keySup = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5F5DA6),
        title: const Text('Suporte'),
      ),
      body: Container(
        color: const Color.fromARGB(201, 73, 79, 86),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width,
                  child: const Align(
                      alignment: Alignment.center,
                      child: Text('Você esta gostando do My Money?',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)))),
              SizedBox(
                // color: Colors.amber,
                height: height * 0.24,
                width: width * 0.55,
                child: const Image(
                  image: AssetImage('assets/img/sup.png'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Sua Opinião nos ajudará a ser melhores!',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
              Form(
                key: _keySup,
                child: Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: height * 0.07,
                        width: width * 0.5,
                        child: CustomFormfielWidget(
                            internlabel: 'Assunto',
                            keybordtype: TextInputType.name,
                            controller: _assuntoemail,
                            cortext: Colors.white,
                            backgrou: const Color(0xff5F5DA6),
                            border: Colors.white)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        height: height * 0.07,
                        width: width * 0.8,
                        child: CustomFormfielWidget(
                            internlabel: 'Descreva sua opnião...',
                            keybordtype: TextInputType.name,
                            controller: _corpoemail,
                            cortext: Colors.white,
                            backgrou: const Color(0xff5F5DA6),
                            border: Colors.white)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: ButtomCustomWidget(
                    altura: 0.07,
                    largura: 0.6,
                    onpressed: () {
                      if (_keySup.currentState!.validate()) {
                        SuportController().emailLaucher(
                            context: context,
                            assunto: _assuntoemail.text,
                            corpo: _corpoemail.text);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: const Text(
                            'Por favor, preencha os campos!',
                            style: TextStyle(
                                color: Color(0xff5F5DA6),
                                fontWeight: FontWeight.w500),
                          ),
                          action: SnackBarAction(
                            backgroundColor: const Color(0xff5F5DA6),
                            label: 'Ok',
                            textColor: Colors.white,
                            onPressed: () {},
                          ),
                        ));
                      }
                    },
                    name: 'Enviar',
                    colortext: const Color(0xff5F5DA6),
                    backgroud: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

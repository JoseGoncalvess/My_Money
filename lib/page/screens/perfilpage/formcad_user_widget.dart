import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/page/screens/home/home_page.dart';

import '../../widgets/avatar_profile_widget.dart';
import '../../widgets/buttom_custom_widget.dart';
import '../../widgets/custom_formfiel_widget.dart';

class FormcadUserWidget extends StatefulWidget {
  const FormcadUserWidget({Key? key}) : super(key: key);

  @override
  State<FormcadUserWidget> createState() => _FormcadUserWidgetState();
}

class _FormcadUserWidgetState extends State<FormcadUserWidget> {
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _moneycontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            'PERFIL',
            style:
                TextStyle(fontSize: height * 0.03, fontWeight: FontWeight.w800),
          ),
        ),
        const AvatarProfileWidget(image: 'assets/img/sem_logo.jpg'),
        SizedBox(
          width: width * 0.7,
          height: height * 0.12,
          child: CustomFormfielWidget(
              backgrou: Colors.white,
              border: Colors.white,
              cortext: const Color(0xff4F4D8C).withOpacity(0.6),
              controller: _namecontroller,
              keybordtype: TextInputType.text,
              internlabel: 'Olá, Me chamo...'),
        ),
        SizedBox(
          width: width * 0.6,
          height: height * 0.1,
          child: CustomFormfielWidget(
              backgrou: Colors.white,
              border: Colors.white,
              cortext: Color(0xff4F4D8C).withOpacity(0.6),
              controller: _moneycontroller,
              keybordtype: TextInputType.number,
              internlabel: 'Meu patrimonio atual é ...'),
        ),
        ButtomCustomWidget(
          backgroud: const Color(0xff4F4D8C),
          colortext: Colors.white,
          name: 'Salvar',
          onpressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
        )
      ],
    );
  }
}

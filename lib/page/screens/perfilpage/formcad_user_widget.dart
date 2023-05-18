import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/page/screens/home/home_page.dart';

import '../../widgets/avatar_profile_widget.dart';
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
    final width = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'PERFIL',
          style:
              TextStyle(fontSize: height * 0.03, fontWeight: FontWeight.w800),
        ),
        const AvatarProfileWidget(image: 'assets/img/sem_logo.jpg'),
        SizedBox(
          width: width * 0.4,
          height: height * 0.1,
          child: CustomFormfielWidget(
              controller: _namecontroller,
              keybordtype: TextInputType.text,
              internlabel: 'Olá, Me chamo...'),
        ),
        SizedBox(
          width: width * 0.3,
          height: height * 0.1,
          child: CustomFormfielWidget(
              controller: _moneycontroller,
              keybordtype: TextInputType.number,
              internlabel: 'Meu patrimonio atual é ...'),
        ),
        SizedBox(
          width: width * 0.24,
          height: height * 0.08,
          child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.white)),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ));

              log("${_moneycontroller.text}, ${_namecontroller.text}");
              _moneycontroller.clear();
              _namecontroller.clear();
            },
            child: Text('Salvar',
                style: TextStyle(
                    color: const Color(0xff4F4D8C),
                    fontSize: height * 0.038,
                    fontWeight: FontWeight.w600)),
          ),
        )
      ],
    );
  }
}
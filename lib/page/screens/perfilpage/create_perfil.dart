import 'package:flutter/material.dart';
import 'formcad_user_widget.dart';

class CreatePerfil extends StatelessWidget {
  const CreatePerfil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: const Color(0xff4F4D8C),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              SizedBox(
                width: width,
                height: height * 0.13,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3.0, bottom: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/logo.png'),
                      Text(
                        'My Money',
                        style: TextStyle(
                            fontSize: height * 0.04,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: MediaQuery.of(context).size.height * 0.56,
                  decoration: BoxDecoration(
                      color: const Color(0xff2E4159),
                      borderRadius: BorderRadius.circular(22)),
                  child: const FormcadUserWidget()),
              SizedBox(
                height: height * 0.10,
              ),
              Flexible(
                child: Text(
                  'Falta pouco para você está controle\n              da sua vida financeira',
                  style: TextStyle(
                      fontSize: height * 0.018, fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

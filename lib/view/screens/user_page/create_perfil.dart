import 'package:flutter/material.dart';
import '../../widgets/logo_inline_widget.dart';
import 'formcad_user_widget.dart';

class CreatePerfil extends StatefulWidget {
  const CreatePerfil({super.key});

  @override
  State<CreatePerfil> createState() => _CreatePerfilState();
}

class _CreatePerfilState extends State<CreatePerfil> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: const Color(0xff4F4D8C),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              spacing: 40,
              children: [
                SizedBox(
                  width: width,
                  height: height * 0.13,
                  child: const LogoInlineWidget(
                    fontsiz: 0.04,
                    imagescale: 0.9,
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    height: MediaQuery.of(context).size.height * 0.56,
                    decoration: BoxDecoration(
                        color: const Color(0xff2E4159),
                        borderRadius: BorderRadius.circular(22)),
                    child: const FormcadUserWidget()),
                Flexible(
                  child: Text(
                    textAlign: TextAlign.center,
                    'Falta pouco para você está controle\n da sua vida financeira!',
                    style: TextStyle(
                        fontSize: height * 0.018, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

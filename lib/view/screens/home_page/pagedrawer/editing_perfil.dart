import 'package:flutter/material.dart';
import '../../../widgets/buttom_custom_widget.dart';
import '../../../widgets/custom_formfiel_widget.dart';
import '../../user_page/user_controller.dart';
import '../home_page.dart';

class EditingPerfil extends StatefulWidget {
  final String name;
  final String totalmoney;
  final String profileimg;
  const EditingPerfil(
      {Key? key,
      required this.name,
      required this.totalmoney,
      required this.profileimg})
      : super(key: key);

  @override
  State<EditingPerfil> createState() => _EditingPerfilState();
}

class _EditingPerfilState extends State<EditingPerfil> {
  final UserController _userController = UserController();
  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _moneycontroller = TextEditingController();

  late String nameperfil = widget.name;
  late String moneyperfil = widget.totalmoney;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5F5DA6),
        title: const Text('Perfil'),
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: height * 0.12,
                  width: width,
                  child: Text('Perfil Atual',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w600)),
                ),
                Container(
                    width: width * 0.9,
                    height: height * 0.7,
                    decoration: BoxDecoration(
                        color: const Color(0xff2E4159),
                        borderRadius: BorderRadius.circular(22)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: width * 0.27,
                            height: height * 0.27,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    'assets/img/sem_logo.jpg',
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.3,
                          height: height * 0.1,
                          child: CustomFormfielWidget(
                              backgrou: Colors.white,
                              border: Colors.white,
                              cortext: const Color(0xff4F4D8C).withOpacity(0.6),
                              controller: _namecontroller,
                              keybordtype: TextInputType.text,
                              internlabel: nameperfil.toUpperCase()),
                        ),
                        SizedBox(
                          width: width * 0.2,
                          height: height * 0.1,
                          child: CustomFormfielWidget(
                              backgrou: Colors.white,
                              border: Colors.white,
                              cortext: const Color(0xff4F4D8C).withOpacity(0.6),
                              controller: _moneycontroller,
                              keybordtype: TextInputType.number,
                              internlabel: 'R\$ $moneyperfil'),
                        ),
                        ButtomCustomWidget(
                            altura: 0.07,
                            largura: 0.7,
                            backgroud: const Color(0xff4F4D8C),
                            colortext: Colors.white,
                            name: 'Salvar',
                            onpressed: () {
                              _userController
                                  .setuser(
                                      nameUser: _namecontroller.text,
                                      moneyUser: _moneycontroller.text)
                                  .then((value) => {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomePage(),
                                            ))
                                      });
                            }),
                        ButtomCustomWidget(
                            altura: 0.07,
                            largura: 0.4,
                            backgroud: const Color(0xff4F4D8C),
                            colortext: Colors.white,
                            name: 'Cancelar',
                            onpressed: () {
                              Navigator.pop(context);
                            })
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

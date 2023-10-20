import 'package:flutter/material.dart';
import '../../../../controller/helprs/formaters/formater_value_payment.dart';
import '../../../../controller/interface_data.dart';
import '../../../../model/avatar_data_model.dart';
import '../../../../model/shared_preferences.dart';
import '../../../widgets/buttom_custom_widget.dart';
import '../../../widgets/custom_formfiel_widget.dart';
import '../../user_page/avatar_select_components/avatar_select_controller.dart';
import '../../user_page/user_controller.dart';
import '../../user_page/widget/avatar_select.dart';
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
  final AvatarSelectController _avatarcontroller = AvatarSelectController();
  SharedPrefs prefs = SharedPrefs();

  late String nameperfil = widget.name;
  late String moneyperfil = widget.totalmoney;
  late List<AvatarDataModel> slider;

  @override
  void initState() {
    super.initState();
    _avatarcontroller.addListener(() {
      setState(() {});
      _namecontroller.text = nameperfil;
      _moneycontroller.text = moneyperfil;
    });
    _avatarcontroller.chekingAVtar(key: keyUserAvatar);
    slider = InterfaceData().imageAvatr;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5F5DA6),
        title: const Text('Seu Perfil'),
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
                  child: const Text('Perfil Atual',
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
                          child: InkWell(
                            onTap: () => {
                              showModalBottomSheet(
                                backgroundColor: const Color(0xff4F4D8C),
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    width: width,
                                    height: height * 0.45,
                                    child: Column(
                                      children: [
                                        Text(
                                          'Selecione seu Avatar',
                                          style: TextStyle(
                                              fontSize: height * 0.04,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: width,
                                          height: height * 0.3,
                                          child: GridView.count(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 5,
                                            children: slider
                                                .map((e) => Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: InkWell(
                                                          onTap: () {
                                                            _avatarcontroller
                                                                .setAvtar(
                                                                    avatar:
                                                                        e.img,
                                                                    key:
                                                                        tempavatar);
                                                          },
                                                          child: AvatarSelect(
                                                              state: e.select,
                                                              img: e.img)),
                                                    ))
                                                .toList(),
                                          ),
                                        ),
                                        ButtomCustomWidget(
                                            onpressed: () =>
                                                Navigator.pop(context),
                                            name: 'ok',
                                            colortext: const Color(0xff4F4D8C),
                                            backgroud: Colors.white,
                                            largura: width * 0.001,
                                            altura: height * 0.00007)
                                      ],
                                    ),
                                  );
                                },
                              )
                            },
                            child: ValueListenableBuilder(
                              valueListenable: _avatarcontroller,
                              builder: (context, value, child) => Container(
                                width: width * 0.27,
                                height: height * 0.27,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        value,
                                      ),
                                    )),
                              ),
                            ),
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
                                      avatar: _avatarcontroller.value !=
                                              widget.profileimg
                                          ? _avatarcontroller.value
                                          : widget.profileimg,
                                      nameUser:
                                          _namecontroller.text != widget.name
                                              ? _namecontroller.text
                                              : widget.name,
                                      moneyUser: _moneycontroller.text !=
                                              widget.totalmoney
                                          ? FormaterValuePayment().formatDouble(
                                              value: _moneycontroller.text)
                                          : FormaterValuePayment().formatDouble(
                                              value: widget.totalmoney))
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

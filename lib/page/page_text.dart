import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/model/evento_model.dart';

import '../model/shared_preferences.dart';

class PageText extends StatefulWidget {
  const PageText({Key? key}) : super(key: key);

  @override
  State<PageText> createState() => _PageTextState();
}

String mapString = '{"user": "Inacio", "newuser": "Inacio"}';
Map map = {'user': 'Inacio', 'newuser': 'Inacio'};

class _PageTextState extends State<PageText> {
  String name = '';
  String data = 'Aguardando comando';

  //TRANSFOMRA STRING EM MAP
// JsonDecoder

//TRANSFORMAR O O OBJETO EM JSON OU MAP EM JSON
  Evento evento = Evento(
      nameEvent: 'futebol',
      dateEvent: '23/03/2020',
      velueEvent: '200',
      categoryEvent: Icons.abc_outlined,
      paymentEvent: 'cartão');
  //1 - Salvea  Evento .tostring

  List<Map> listaEventos = [];
  // final prefs = SharedPrefs.prefs;

  Future loadname() async {
    var usernme = await SharedPrefs.prefs.getStringList('evento');
    return usernme;
  }

  getname() {
    loadname().then((value) {
      setState(() {
        eventosstring = value;
      });
    });
  }

  List<String> eventosstring = [];

  percorrerlista() {
    for (var e in eventosstring) {
      var item = jsonEncode(e);
      var json = jsonDecode(item);
      var object = jsonDecode(json) as Map<String, dynamic>;
      var evento = Evento.fromMap(object);
      log(toString());
      // log(jsonDecode(e));
      // log(json);
    }
  }

  Future savename({required key, required list}) async {
    await SharedPrefs.prefs.setStringList(key, list);
  }

  // var result = jsonEncode(map);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Testing data'),
        centerTitle: true,
      ),
      body: Container(
          child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              color: Color.fromARGB(255, 236, 66, 15),
              width: width,
              height: height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width,
                    alignment: Alignment.center,
                    child: Text(
                      data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: width,
                  height: height * 0.12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          var StringJson = evento.toJson();
                          eventosstring.add(StringJson);
                          log(eventosstring.toList().toString());
                          savename(key: 'evento1', list: eventosstring);
                          log('Salvo..');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.blueAccent,
                          width: width * 0.4,
                          height: height * 0.1,
                          child: const Text(
                            'SaveData',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // setState(() {
                          //   // //TRANSFORMEI MEU OBJETO EM  UM TOPO STRING
                          //   // var jsonevent =
                          //   //     jsonEncode(evento); //agora é apenas uma string
                          //   // //
                          //   // var StringJson =
                          //   //     evento.toJson(); //agora eum String Json

                          //   // //TRANSFORMA MINHA STRNG EM UM OBJETO JSON
                          //   // var objectJson = jsonDecode(
                          //   //     StringJson); //me retora uma  _Map<String, dynamic>

                          //   // log(objectJson.runtimeType.toString());

                          //   // data = eventosstring;

                          // });
                          percorrerlista();
                          // getname();
                          log('Carregou...');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.green,
                          width: width * 0.4,
                          height: height * 0.1,
                          child: const Text(
                            'LoadData',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      )),
    );
  }
}

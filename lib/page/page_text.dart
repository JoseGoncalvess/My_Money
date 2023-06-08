import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/model/evento_model.dart';
import 'package:my_money/page/screens/home/widget%20componets/card_event_list_widget.dart';

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
      parcelEvnet: '4',
      nameEvent: 'Churarsco',
      dateEvent: '23/01/2020',
      velueEvent: '3000',
      categoryEvent: Icons.food_bank_rounded,
      paymentEvent: 'Dineheiro');
  //1 - Salvea  Evento .tostring

  List<Map> listaEventos = [];
  // final prefs = SharedPrefs.prefs;

  Future loadname() async {
    var usernme = await SharedPrefs.prefs.getStringList('evento1');
    return usernme;
  }

  getname() {
    loadname().then((value) {
      setState(() {
        eventosstring = value;
      });
      getelemnet();
    });
  }

  List<String> eventosstring = [];
  List<Evento> eventos = [];
  getelemnet() {
    setState(() {
      for (var element in eventosstring) {
        var event = jsonDecode(element);
        var i = Evento.fromMap(event);
        eventos.add(i);
      }
    });
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
                child: ListView.builder(
                    itemCount: eventos.isEmpty ? 1 : eventos.length,
                    itemBuilder: (context, index) => eventos.isEmpty
                        ? Column(
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
                          )
                        : CardEventListWidget(
                            EventData: eventos[index].dateEvent,
                            eventName: eventos[index].nameEvent,
                            eventValue: eventos[index].velueEvent,
                            iconCategory: eventos[index].categoryEvent,
                          ))),
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
                          setState(() {
                            //mapeio o objeto em transformo em json Sring;
                            String jsonstring = evento.toJson();
                            var item = Evento.fromJson(jsonstring);
                            data = item.nameEvent;
                          });

                          // var eventojson = evento.toJson();

                          // eventosstring.add(eventojson);
                          // savename(key: 'evento1', list: eventosstring);

                          // log('Salvo..');
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
                          getname();

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

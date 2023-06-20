import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/model/evento_model.dart';
import 'package:my_money/model/shared_preferences.dart';
import 'package:my_money/page/screens/home/tabbar_menu_widget.dart';
import '../eventopage/evento_page.dart';
import 'list_drawer_widget.dart';
import 'new_item_widget.dart';
import 'widget componets/card_event_list_widget.dart';

class HomePage extends StatefulWidget {
  final List<Evento>? eventos;
  const HomePage({Key? key, required this.eventos}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

final prefs = SharedPrefs();

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final SharedPrefs prefs = SharedPrefs();
  List<Evento> eventos = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  String skey = 'evento1';
  List<Evento> getEventsList({required String skey}) {
    prefs.loadList(key: skey).then((value) {
      List<String>? listString = value;
      for (var e in listString!) {
        var ev = jsonDecode(e);
        var i = Evento.fromMap(ev);
        eventos.add(i);
      }
    });
    return eventos;
  }

  @override
  void initState() {
    getEventsList(skey: 'evento1');
    log(eventos.toString());
    log(eventos.length.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log(eventos.length.toString());
    log(eventos.toString());
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(
        backgroundColor: Color(0xff5F5DA6),
        child: ListDrawerWidget(),
      ),
      key: _key,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: height * 0.887,
              width: width,
              color: Colors.white,
              child: eventos.isEmpty
                  ? const NewItemWidget()
                  : ListView.builder(
                      itemCount: eventos.isEmpty ? 1 : eventos.length,
                      itemBuilder: (context, index) => GestureDetector(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text('Deseja memso Excluir o item?'),
                                actions: [
                                  Row(
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            prefs.removeEvnetList(
                                                key: 'evento1', index: index);
                                          },
                                          child: Text('sim'))
                                    ],
                                  )
                                ],
                              );
                            },
                          );
                        },
                        child: CardEventListWidget(
                          eventData: eventos[index].dateEvent,
                          eventName: eventos[index].nameEvent,
                          eventValue: eventos[index].velueEvent,
                          iconCategory: eventos[index].categoryEvent,
                        ),
                      ),
                    ),
            ),
          ),
          const TabbarMenuWidget()
        ]),
      ),
      floatingActionButton: SizedBox(
        width: width * 0.16,
        height: height * 0.15,
        child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EventoPage(),
                  ));
            },
            elevation: 2,
            backgroundColor: const Color(0xff5F5DA6),
            child: const Icon(
              Icons.add,
              size: 20,
              color: Colors.white,
            )),
      ),
    );
  }
}

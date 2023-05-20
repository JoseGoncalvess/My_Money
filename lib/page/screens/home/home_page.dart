import 'package:flutter/material.dart';
import 'package:my_money/page/screens/home/new_item_widget.dart';
import 'package:my_money/page/screens/home/tabbar_menu_widget.dart';

import '../eventopage/evento_page.dart';
import 'list_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List eventos = [];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Color(0xff5F5DA6),
        child: ListDrawerWidget(),
      ),
      key: _key,
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(children: [
          Container(
            height: height,
            width: width,
            color: Colors.white,
            child: eventos.isEmpty
                ? const NewItemWidget()
                : ListView.builder(
                    itemCount: eventos.isEmpty ? 1 : eventos.length,
                    itemBuilder: (context, index) => Container()),
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

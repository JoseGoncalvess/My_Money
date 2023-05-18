import 'package:flutter/material.dart';
import 'package:my_money/page/screens/home/new_item_widget.dart';
import 'package:my_money/page/screens/home/tabbar_menu_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List eventos = [];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Stack(children: [
          Container(
            height: height,
            width: width,
            color: Colors.white,
            child: eventos.isEmpty
                ? NewItemWidget()
                : ListView.builder(
                    itemCount: eventos.isEmpty ? 1 : eventos.length,
                    itemBuilder: (context, index) => Container()),
          ),
          TabbarMenuWidget()
        ]),
      ),
      floatingActionButton: SizedBox(
        width: width * 0.09,
        height: height * 0.15,
        child: FloatingActionButton(
            onPressed: () {},
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

import 'package:flutter/material.dart';
import 'package:my_money/model/evento_model.dart';
import 'package:my_money/view/screens/home_page/widgets/tabbar_menu_widget.dart';
import '../eventopage/evento_page.dart';
import 'home_controller.dart';
import 'pagedrawer/list_drawer_widget.dart';
import 'widgets/new_item_widget.dart';
import 'widgets/card_event_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  final HomeController _homecontroller = HomeController();
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              child: _homecontroller.value.isEmpty
                  ? const NewItemWidget()
                  : ValueListenableBuilder<List<Evento>>(
                      valueListenable: _homecontroller,
                      builder: (context, value, child) {
                        return ListView.builder(
                          itemCount: value.isEmpty ? 1 : value.length,
                          itemBuilder: (context, index) => GestureDetector(
                            child: CardEventListWidget(
                              eventData: value[index].dateEvent,
                              eventName: value[index].nameEvent,
                              eventValue: value[index].velueEvent,
                              iconCategory: value[index].categoryEvent,
                            ),
                          ),
                        );
                      },
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
//  onLongPress: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     content:
//                                         Text('Deseja memso Excluir o item?'),
//                                     actions: [
//                                       Row(
//                                         children: [
//                                           ElevatedButton(
//                                               onPressed: () {
//                                                 prefs.removeEvnetList(
//                                                     key: 'evento1',
//                                                     index: index);
//                                               },
//                                               child: Text('sim'))
//                                         ],
//                                       )
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
import 'package:flutter/material.dart';
import 'package:my_money/model/shared_preferences.dart';
import '../../../../../../model/evento_model.dart';
import '../../../../home_page/home_controller.dart';
import '../../../../home_page/widgets/card_event_list_widget.dart';

class LastEventsWidget extends StatefulWidget {
  const LastEventsWidget({Key? key}) : super(key: key);

  @override
  State<LastEventsWidget> createState() => _LastEventsWidgetState();
}

class _LastEventsWidgetState extends State<LastEventsWidget> {
  final HomeController _homecontroller = HomeController();

  @override
  void initState() {
    super.initState();
    _homecontroller.addListener(() {
      setState(() {});
    });
    _homecontroller.getevetList(key: keyList);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Ultimas Movimentações',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: height * 0.025),
          ),
        ),
        Container(
          width: width * 0.9,
          height: height * 0.281,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: ValueListenableBuilder<List<Evento>>(
            valueListenable: _homecontroller,
            builder: (_, value, child) {
              return ListView.builder(
                itemCount: value.length < 2 ? value.length : 2,
                itemBuilder: (context, index) {
                  List<Evento> list = value.reversed.toList();
                  return CardEventListWidget(
                    eventData: list[index].dateEvent,
                    eventName: list[index].nameEvent,
                    eventValue: list[index].velueEvent,
                    iconCategory: list[index].categoryEvent,
                  );
                },
              );
            },
          ),
        )
      ],
    );
  }
}

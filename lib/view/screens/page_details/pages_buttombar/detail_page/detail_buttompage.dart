import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/controller/interface_data.dart';
import '../../../home_page/widgets/card_event_list_widget.dart';
import '../../../home_page/widgets/new_item_widget.dart';
import 'details_controller.dart';
import 'details_widget_components/eventos_info_widget.dart';

class DetailButtompage extends StatefulWidget {
  final PageController pagecontroller;
  const DetailButtompage({
    super.key,
    required this.pagecontroller,
  });

  @override
  State<DetailButtompage> createState() => _DetailButtompageState();
}

class _DetailButtompageState extends State<DetailButtompage>
    with TickerProviderStateMixin {
  final DetailsController _detailsController = DetailsController();
  bool loading = false;

  @override
  void initState() {
    super.initState();
    _detailsController.addListener(() {
      setState(() {});
    });
    _detailsController.infoevent.addListener(() {
      setState(() {});
    });
    _detailsController.month.addListener(() {
      setState(() {});
    });
    _detailsController.loading$.addListener(() {
      setState(() {});
    });

    _detailsController.getInfoMoth(pagenum: 1);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Scaffold(
        body: Container(
          width: width,
          height: height,
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  left: 7,
                  right: 7,
                  child: Column(
                    children: [
                      Text(
                        'Eventos do periodo',
                        style: TextStyle(
                            color: const Color(0xff5F5DA6),
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.03),
                      ),
                      Container(
                          width: width,
                          height: height * 0.5,
                          decoration: BoxDecoration(
                              color: const Color(0xFF5F5DA6).withAlpha(200),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          child: !_detailsController.loading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 5,
                                  ),
                                )
                              : ValueListenableBuilder(
                                  valueListenable: _detailsController,
                                  builder: (context, value, child) {
                                    return ListView.builder(
                                        itemCount:
                                            value.isEmpty ? 1 : value.length,
                                        itemBuilder: (context, index) {
                                          return value.isEmpty
                                              ? SizedBox(
                                                  height: height * 0.5,
                                                  child: const NewItemWidget(
                                                    coloricon: Colors.white,
                                                    colortext: Colors.white,
                                                    mensseger:
                                                        'Sem eventos este mês !',
                                                  ),
                                                )
                                              : CardEventListWidget(
                                                  eventData:
                                                      value[index].dateEvent,
                                                  eventName:
                                                      value[index].nameEvent,
                                                  eventValue:
                                                      value[index].velueEvent,
                                                  iconCategory: value[index]
                                                      .categoryEvent,
                                                );
                                        });
                                  },
                                )),
                    ],
                  )),
              Positioned(
                top: 50,
                left: 4,
                right: 4,
                child: ValueListenableBuilder(
                  valueListenable: _detailsController.infoevent,
                  builder: (context, value, child) => EventosInfoWidget(
                    h: 0.2,
                    w: 0.7,
                    eventnumber: value.ntransition,
                    icon: Icons.list_alt_rounded,
                    namepayment: 'Eventos de ${_detailsController.month.value}',
                    value: value.strasition,
                  ),
                ),
              ),
              Positioned(
                  top: 0,
                  child: SizedBox(
                    width: width,
                    height: height * 0.07,
                    child: PageView(
                        onPageChanged: (value) {
                          _detailsController.onpagechange(pagenum: value);
                          log(widget.pagecontroller.page!.round().toString());
                        },
                        scrollDirection: Axis.horizontal,
                        controller: widget.pagecontroller,
                        children: InterfaceData()
                            .months
                            .map((e) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e.toUpperCase(),
                                      style: TextStyle(
                                          color:
                                              _detailsController.month.value ==
                                                      e
                                                  ? const Color(0xff5F5DA6)
                                                  : Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.02),
                                    ),
                                  ],
                                ))
                            .toList()),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

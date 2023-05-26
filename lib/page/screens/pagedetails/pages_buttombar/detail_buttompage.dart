import 'dart:developer';
import 'package:flutter/material.dart';
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
  List<String> meses = [
    'janeiro',
    'fevereiro',
    'março',
    'abril',
    'mail',
    'junho',
    'julho',
    'agosto',
    'setembro',
    'outubro',
    'novembro',
    'dezembro'
  ];

  int page = 0;
  Future getmes({required int index}) async {
    var item = '';

    item = meses[index];
    setState(() {
      mes = item;
    });

    return item;
  }

  String mes = '';

  _onpagechange(int pagenum) {
    setState(() {
      page = pagenum;
    });
    // return Text('("Current Page: +${page.toString()})');
    log('("Current Page: +${page.toString()})');
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
                          width: width * 0.9,
                          height: height * 0.5,
                          decoration: BoxDecoration(
                              color: Color(0xFF5F5DA6).withAlpha(200),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          child: FutureBuilder(
                            future: getmes(index: page),
                            builder: (context, snapshot) => ListView.builder(
                              itemCount: meses.length,
                              itemBuilder: (context, index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF2E4159),
                                      borderRadius: BorderRadius.circular(22)),
                                  width: width * 0.8,
                                  height: height * 0.1,
                                  alignment: Alignment.center,
                                  child: Text(snapshot.data.toString()),
                                ),
                              ),
                            ),
                          )),
                    ],
                  )),
              Positioned(
                top: 50,
                left: 4,
                right: 4,
                child: EventosInfoWidget(
                  h: 0.2,
                  w: 0.7,
                  eventnumber: meses.length.toString(),
                  icon: Icons.list_alt_rounded,
                  namepayment: 'Eventos de ${mes}',
                  value: '3000',
                ),
              ),
              Positioned(
                  top: 0,
                  child: Container(
                    width: width,
                    height: height * 0.07,
                    child: PageView(
                        onPageChanged: _onpagechange,
                        scrollDirection: Axis.horizontal,
                        controller: widget.pagecontroller,
                        children: meses
                            .map((e) => Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      e.toUpperCase(),
                                      style: TextStyle(
                                          color: const Color(0xff5F5DA6),
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

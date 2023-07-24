import 'package:flutter/material.dart';
import 'package:my_money/model/shared_preferences.dart';
import 'package:my_money/view/screens/page_details/pages_buttombar/grafic_page/models/colun_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../home_page/home_controller.dart';
import '../grafic_controller.dart';

class MediaMonthWidget extends StatefulWidget {
  const MediaMonthWidget({Key? key}) : super(key: key);

  @override
  State<MediaMonthWidget> createState() => _MediaMonthWidgetState();
}

class Datacolun {
  String x;
  double y;
  Datacolun({
    required this.x,
    required this.y,
  });
}

class _MediaMonthWidgetState extends State<MediaMonthWidget> {
  final GraficController _graficController = GraficController();
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    _homeController.addListener(() {
      setState(() {});
    });
    _graficController.listcategory.addListener(() {
      setState(() {});
    });
    _homeController.getevetList(key: keyList).then((value) =>
        {_graficController.getdataColun(list: _homeController.value)});
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.98,
      height: height * 0.4,
      // color: Colors.green,
      child: Column(
        children: [
          Text(
            'Media de Gastos Mensal',
            style: TextStyle(
                color: const Color(0xff5F5DA6),
                fontWeight: FontWeight.bold,
                fontSize: height * 0.03),
          ),
          Container(
            alignment: Alignment.center,
            // color: Colors.red,
            width: width * 0.96,
            height: height * 0.35,
            child: ValueListenableBuilder(
              valueListenable: _graficController.listgastomonth,
              builder: (context, value, child) => SfCartesianChart(
                margin: const EdgeInsets.all(2),
                primaryXAxis: CategoryAxis(
                    labelStyle: const TextStyle(
                  color: Color(0xff5F5DA6),
                )),
                primaryYAxis: NumericAxis(
                    title: AxisTitle(),
                    labelStyle: const TextStyle(color: Color(0xff5F5DA6))),
                series: <ChartSeries>[
                  ColumnSeries<ColunData, String>(
                      enableTooltip: true,
                      dataSource: value,
                      xValueMapper: (ColunData data, _) => data.xmonth,
                      yValueMapper: (ColunData data, _) => data.yvalue,
                      color: const Color(0xff5F5DA6),
                      dataLabelSettings: const DataLabelSettings(
                          isVisible: true, color: Color(0xff5F5DA6))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

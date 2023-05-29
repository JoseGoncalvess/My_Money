import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

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
  late List<Datacolun> _datacolum;
  dynamic getdatacolun() {
    final List<Datacolun> datacolum = <Datacolun>[
      Datacolun(x: 'JAN', y: 200),
      Datacolun(x: 'FEV', y: 50),
      Datacolun(x: 'MAR', y: 300),
      Datacolun(x: 'MAI', y: 880),
      Datacolun(x: 'JUN', y: 150),
      Datacolun(x: 'JUL', y: 200),
      Datacolun(x: 'AGO', y: 88),
      Datacolun(x: 'SET', y: 44),
      Datacolun(x: 'OUT', y: 1000),
      Datacolun(x: 'NOV', y: 362),
      Datacolun(x: 'DEZ', y: 67),
    ];
    return datacolum;
  }

  @override
  void initState() {
    _datacolum = getdatacolun();
    super.initState();
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
            child: SfCartesianChart(
              margin: const EdgeInsets.all(2),
              primaryXAxis: CategoryAxis(
                  labelStyle: const TextStyle(
                color: Color(0xff5F5DA6),
              )),
              primaryYAxis: NumericAxis(
                  title: AxisTitle(),
                  labelStyle: const TextStyle(color: Color(0xff5F5DA6))),
              series: <ChartSeries>[
                ColumnSeries<Datacolun, String>(
                    enableTooltip: true,
                    dataSource: _datacolum,
                    xValueMapper: (Datacolun data, _) => data.x,
                    yValueMapper: (Datacolun data, _) => data.y,
                    color: const Color(0xff5F5DA6),
                    dataLabelSettings: const DataLabelSettings(
                        isVisible: true, color: Color(0xff5F5DA6))),
              ],
            ),
          )
        ],
      ),
    );
  }
}

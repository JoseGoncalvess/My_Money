import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficCategoryWidget extends StatefulWidget {
  const GraficCategoryWidget({Key? key}) : super(key: key);

  @override
  State<GraficCategoryWidget> createState() => _GraficCategoryWidgetState();
}

class categoryevent {
  String category;
  int valeu;
  categoryevent({
    required this.category,
    required this.valeu,
  });
}

late List<categoryevent> _datagrafcategory;

List<categoryevent> getcategory() {
  final List<categoryevent> dataEvent = [
    categoryevent(category: 'Viagem', valeu: 800),
    categoryevent(category: 'Saude', valeu: 2000),
    categoryevent(category: 'Lazer', valeu: 100),
    categoryevent(category: 'trabalho', valeu: 30),
    categoryevent(category: 'Investimento', valeu: 300),
  ];
  return dataEvent;
}

@override
class _GraficCategoryWidgetState extends State<GraficCategoryWidget> {
  void initState() {
    _datagrafcategory = getcategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.97,
      height: height * 0.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(
            'Dispesas por Categoria',
            style: TextStyle(
                color: const Color(0xff5F5DA6),
                fontWeight: FontWeight.bold,
                fontSize: height * 0.03),
          ),
          Row(
            children: [
              Container(
                // color: Colors.amber,
                width: width * 0.97,
                height: height * 0.34,
                child: SfCircularChart(
                  legend: Legend(
                      isVisible: true,
                      textStyle: TextStyle(color: Color(0xff5F5DA6)),
                      overflowMode: LegendItemOverflowMode.wrap),
                  series: <CircularSeries>[
                    PieSeries<categoryevent, String>(
                      dataSource: _datagrafcategory,
                      xValueMapper: (categoryevent data, _) => data.category,
                      yValueMapper: (categoryevent data, _) => data.valeu,
                      dataLabelSettings: DataLabelSettings(
                        isVisible: true,
                        color: Color(0xff5F5DA6),
                      ),
                      enableTooltip: true,
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

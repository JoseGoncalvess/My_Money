import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class TypePaymentWidget extends StatefulWidget {
  const TypePaymentWidget({Key? key}) : super(key: key);

  @override
  State<TypePaymentWidget> createState() => _TypePaymentWidgetState();
}

class Paymentdata {
  double x;
  double y;
  double y2;
  Paymentdata({
    required this.x,
    required this.y,
    required this.y2,
  });
}

List<Paymentdata> getdgetpayment() {
  final List<Paymentdata> datpayment = [
    Paymentdata(x: 1, y: 21, y2: 55),
    Paymentdata(x: 2, y: 22, y2: 15),
    Paymentdata(x: 3, y: 44, y2: 105),
    Paymentdata(x: 4, y: 1, y2: 28)
  ];
  return datpayment;
}

class _TypePaymentWidgetState extends State<TypePaymentWidget> {
  late List<Paymentdata> _datapayment;
  @override
  void initState() {
    _datapayment = getdgetpayment();
    super.initState();
  }

  @override
  void dispose() {
    _datapayment.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Text(
          'Tipos de Pagamentos',
          style: TextStyle(
              color: const Color(0xff5F5DA6),
              fontWeight: FontWeight.bold,
              fontSize: height * 0.03),
        ),
        Container(
          height: height * 0.5,
          width: width * 0.97,
          // color: Colors.brown,
          child: SfCartesianChart(
            legend: Legend(
              isVisible: true,
              overflowMode: LegendItemOverflowMode.wrap,
              textStyle: TextStyle(
                  color: const Color(0xFF2E4159),
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.03),
            ),
            primaryXAxis: NumericAxis(
                labelStyle: TextStyle(
                    color: const Color(0xFF2E4159),
                    fontWeight: FontWeight.w500,
                    fontSize: height * 0.02),
                axisLine: const AxisLine(width: 1),
                labelFormat: '{value}'),
            primaryYAxis: NumericAxis(
              labelFormat: 'R\$ {value}',
              labelStyle: TextStyle(
                  color: const Color(0xff5F5DA6),
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.02),
              edgeLabelPlacement: EdgeLabelPlacement.shift,
              axisLine: const AxisLine(width: 1),
              // interval: 2,
              majorTickLines: const MajorTickLines(
                  width: 1, color: Color(0xFF2E4159), size: 1),
              majorGridLines: const MajorGridLines(
                  width: 1, color: Color(0xFF2E4159), dashArray: [5, 5]),
            ),
            series: <ChartSeries>[
              SplineSeries<Paymentdata, double>(
                  color: Colors.green,
                  dataSource: _datapayment,
                  xValueMapper: (Paymentdata data, _) => data.x,
                  yValueMapper: (Paymentdata data, _) => data.y,
                  width: 2,
                  name: 'Cartão',
                  markerSettings:
                      MarkerSettings(isVisible: true, color: Colors.white),
                  dataLabelSettings:
                      DataLabelSettings(color: Colors.green, isVisible: true)),
              SplineSeries<Paymentdata, double>(
                  color: Colors.amber,
                  animationDuration: 0,
                  dataSource: _datapayment,
                  xValueMapper: (Paymentdata data, _) => data.x,
                  yValueMapper: (Paymentdata data, _) => data.y2,
                  width: 2,
                  name: 'Dinheiro',
                  enableTooltip: true,
                  markerSettings: const MarkerSettings(
                      isVisible: true, color: Colors.white),
                  dataLabelSettings: const DataLabelSettings(
                      color: Colors.amber, isVisible: true))
            ],
          ),
        ),
      ],
    );
  }
}

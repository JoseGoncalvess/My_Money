// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../grafic_widgets_components/card_info_widget.dart';
import '../grafic_widgets_components/grafic_category_widget.dart';
import '../grafic_widgets_components/media_month_widget.dart';

class GraficButtompag extends StatefulWidget {
  const GraficButtompag({Key? key}) : super(key: key);

  @override
  State<GraficButtompag> createState() => _GraficButtompagState();
}

class Cardpayment {
  double dia;
  double valuercard;
  Cardpayment({
    required this.dia,
    required this.valuercard,
  });
}

class Moneypayment {
  double dia;
  double valuercard;
  Moneypayment({
    required this.dia,
    required this.valuercard,
  });
}

List<Cardpayment> getdatacard() {
  final List<Cardpayment> datpayment = [
    Cardpayment(dia: 1, valuercard: 200),
    Cardpayment(dia: 3, valuercard: 4),
    Cardpayment(dia: 1, valuercard: 800),
    Cardpayment(dia: 3, valuercard: 30),
  ];
  return datpayment;
}

List<Moneypayment> getmoneypayment() {
  final List<Moneypayment> moneypayment = [
    Moneypayment(dia: 4, valuercard: 500),
    Moneypayment(dia: 6, valuercard: 20),
    Moneypayment(dia: 6, valuercard: 10),
    Moneypayment(dia: 1, valuercard: 100),
  ];
  return moneypayment;
}

class _GraficButtompagState extends State<GraficButtompag> {
  late List<Cardpayment> _datacard;
  late List<Moneypayment> _datamoney;
  @override
  void initState() {
    _datacard = getdatacard();
    _datamoney = getmoneypayment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Colors.white,
        child: SingleChildScrollView(
            child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CardInfoWidget(
                        icon: Icons.attach_money_rounded,
                        nameinfo: 'Saldo',
                        valueinfo: '200'),
                    CardInfoWidget(
                      icon: Icons.arrow_downward_rounded,
                      nameinfo: 'Dividas',
                      valueinfo: '100',
                    )
                  ],
                )),
            SizedBox(
              height: height * 0.01,
            ),
            const GraficCategoryWidget(),
            SizedBox(
              height: height * 0.01,
            ),
            const MediaMonthWidget(),
            SizedBox(
              height: height * 0.01,
            ),
            Text(
              'Movimentações',
              style: TextStyle(
                  color: const Color(0xff5F5DA6),
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.03),
            ),
            Container(
              height: height * 0.3,
              width: width * 0.97,
              // color: Colors.brown,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  isVisible: true,
                  labelStyle: TextStyle(color: const Color(0xff5F5DA6)),
                  edgeLabelPlacement: EdgeLabelPlacement.shift,
                  majorGridLines: MajorGridLines(color: Colors.amber),
                  axisLine: AxisLine(
                    color: const Color(0xff5F5DA6),
                    width: 2,
                  ),
                ),
                primaryYAxis: NumericAxis(
                    isVisible: true,
                    labelStyle: TextStyle(color: const Color(0xff5F5DA6)),
                    axisLine: AxisLine(color: const Color(0xff5F5DA6))),
                series: <ChartSeries>[
                  SplineSeries<Cardpayment, double>(
                    dataSource: _datacard,
                    xValueMapper: (Cardpayment data, _) => data.valuercard,
                    yValueMapper: (Cardpayment data, _) => data.dia,
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      color: const Color(0xff5F5DA6),
                      connectorLineSettings:
                          ConnectorLineSettings(type: ConnectorType.curve),
                    ),
                  ),
                  SplineSeries<Moneypayment, double>(
                    dataSource: _datamoney,
                    xValueMapper: (Moneypayment data, _) => data.valuercard,
                    yValueMapper: (Moneypayment data, _) => data.dia,
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      color: const Color(0xff5F5DA6),
                      connectorLineSettings:
                          ConnectorLineSettings(type: ConnectorType.curve),
                    ),
                  )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}

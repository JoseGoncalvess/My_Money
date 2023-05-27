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
    Cardpayment(dia: 23, valuercard: 200),
    Cardpayment(dia: 3, valuercard: 4),
    Cardpayment(dia: 12, valuercard: 800),
    Cardpayment(dia: 7, valuercard: 30),
  ];
  return datpayment;
}

List<Moneypayment> getmoneypayment() {
  final List<Moneypayment> moneypayment = [
    Moneypayment(dia: 20, valuercard: 500),
    Moneypayment(dia: 6, valuercard: 20),
    Moneypayment(dia: 2, valuercard: 0),
    Moneypayment(dia: 30, valuercard: 100),
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
            Container(
              height: height * 0.3,
              width: width * 0.9,
              color: Colors.brown,
              child: SfCartesianChart(
                series: <ChartSeries>[
                  LineSeries<Cardpayment, double>(
                    dataSource: _datacard,
                    xValueMapper: (Cardpayment data, _) => data.dia,
                    yValueMapper: (Cardpayment data, _) => data.valuercard,
                  ),
                  LineSeries<Moneypayment, double>(
                    dataSource: _datamoney,
                    xValueMapper: (Moneypayment data, _) => data.dia,
                    yValueMapper: (Moneypayment data, _) => data.valuercard,
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

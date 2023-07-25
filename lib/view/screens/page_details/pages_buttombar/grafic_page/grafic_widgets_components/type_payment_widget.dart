import 'package:flutter/material.dart';
import 'package:my_money/model/shared_preferences.dart';
import 'package:my_money/view/screens/page_details/pages_buttombar/grafic_page/models/payment_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../home_page/home_controller.dart';
import '../grafic_controller.dart';
import 'custom_alert.dart';

class TypePaymentWidget extends StatefulWidget {
  const TypePaymentWidget({Key? key}) : super(key: key);

  @override
  State<TypePaymentWidget> createState() => _TypePaymentWidgetState();
}

class _TypePaymentWidgetState extends State<TypePaymentWidget> {
  final GraficController _graficController = GraficController();
  final HomeController _homeController = HomeController();

  @override
  void initState() {
    super.initState();
    _homeController.addListener(() {
      setState(() {});
    });
    _graficController.listvaluepayment.addListener(() {
      setState(() {});
    });
    _homeController.getevetList(key: keyList).then((value) =>
        {_graficController.getTypePayment(list: _homeController.value)});
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
        SizedBox(
          height: height * 0.5,
          width: width * 0.97,
          child: ValueListenableBuilder(
            valueListenable: _graficController.listvaluepayment,
            builder: (context, value, child) => value.isEmpty
                ? const CustomAlert(
                    icon: Icons.attach_money_rounded,
                    mensseger: 'Sem Registro de Pagamentos...',
                  )
                : SfCartesianChart(
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
                          width: 1,
                          color: Color(0xFF2E4159),
                          dashArray: [5, 5]),
                    ),
                    series: <ChartSeries>[
                      SplineSeries<PaymentModel, double>(
                          color: Colors.green,
                          dataSource: value,
                          xValueMapper: (PaymentModel data, _) =>
                              data.xnubermtrasations,
                          yValueMapper: (PaymentModel data, _) =>
                              data.ytransationtipo1,
                          width: 2,
                          name: 'Cartão',
                          markerSettings: const MarkerSettings(
                              isVisible: true, color: Colors.white),
                          dataLabelSettings: const DataLabelSettings(
                              color: Colors.green, isVisible: true)),
                      SplineSeries<PaymentModel, double>(
                          color: Colors.amber,
                          animationDuration: 0,
                          dataSource: value,
                          xValueMapper: (PaymentModel data, _) =>
                              data.xnubermtrasations,
                          yValueMapper: (PaymentModel data, _) =>
                              data.ytransationtipo2,
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
        ),
      ],
    );
  }
}

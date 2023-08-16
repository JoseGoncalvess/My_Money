import 'package:flutter/material.dart';
import 'package:my_money/model/shared_preferences.dart';
import 'package:my_money/view/screens/home_page/home_controller.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../grafic_controller.dart';
import '../models/category_event.dart';
import 'custom_alert.dart';

class GraficCategoryWidget extends StatefulWidget {
  const GraficCategoryWidget({Key? key}) : super(key: key);

  @override
  State<GraficCategoryWidget> createState() => _GraficCategoryWidgetState();
}

@override
class _GraficCategoryWidgetState extends State<GraficCategoryWidget> {
  GraficController graficController = GraficController();
  HomeController homeController = HomeController();

  @override
  void initState() {
    super.initState();
    homeController.addListener(() {
      setState(() {});
    });
    graficController.listcategory.addListener(() {
      setState(() {});
    });
    homeController.getevetList(key: keyList).then((value) =>
        {graficController.getcategorylist(list: homeController.value)});
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
            'Dispesa por Categoria',
            style: TextStyle(
                color: const Color(0xff5F5DA6),
                fontWeight: FontWeight.bold,
                fontSize: height * 0.03),
          ),
          Row(
            children: [
              SizedBox(
                //color: Colors.amber,
                width: width * 0.97,
                height: height * 0.34,
                child: ValueListenableBuilder<List<CategoryEvent>>(
                  valueListenable: graficController.listcategory,
                  builder: (context, value, child) => value.isEmpty
                      ? const CustomAlert(
                          icon: Icons.app_registration_rounded,
                          mensseger: 'Sem Registros de Eventos',
                        )
                      : SfCircularChart(
                          legend: Legend(
                              isVisible: true,
                              textStyle:
                                  const TextStyle(color: Color(0xff5F5DA6)),
                              overflowMode: LegendItemOverflowMode.wrap),
                          series: <CircularSeries>[
                            PieSeries<CategoryEvent, String>(
                              dataSource: value,
                              xValueMapper: (CategoryEvent data, _) =>
                                  data.category,
                              yValueMapper: (CategoryEvent data, _) =>
                                  data.valeu,
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: true,
                                color: Color(0xff5F5DA6),
                              ),
                              enableTooltip: true,
                            ),
                          ],
                        ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

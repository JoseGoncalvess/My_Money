import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../grafic_widgets_components/card_info_widget.dart';

class GraficButtompag extends StatelessWidget {
  const GraficButtompag({Key? key}) : super(key: key);

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
            Row(
              children: [],
            ),
            Container(
              width: width * 0.97,
              height: height * 0.4,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color.fromARGB(176, 95, 93, 166),
                  width: 4.0,
                ),
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
                        color: Colors.amber,
                        width: width * 0.6,
                        height: height * 0.3,
                        child: Container(),
                      )
                    ],
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

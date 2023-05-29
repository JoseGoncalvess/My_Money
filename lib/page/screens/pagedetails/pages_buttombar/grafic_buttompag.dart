// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../grafic_widgets_components/card_info_widget.dart';
import '../grafic_widgets_components/grafic_category_widget.dart';
import '../grafic_widgets_components/media_month_widget.dart';
import '../grafic_widgets_components/type_payment_widget.dart';

class GraficButtompag extends StatefulWidget {
  const GraficButtompag({Key? key}) : super(key: key);

  @override
  State<GraficButtompag> createState() => _GraficButtompagState();
}

class _GraficButtompagState extends State<GraficButtompag> {
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
            TypePaymentWidget()
          ],
        )),
      ),
    );
  }
}

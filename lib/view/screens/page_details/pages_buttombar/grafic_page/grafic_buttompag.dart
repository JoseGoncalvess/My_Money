// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:my_money/model/shared_preferences.dart';
import 'package:my_money/view/screens/home_page/home_controller.dart';
import '../../../../widgets/load_widget.dart';
import 'grafic_controller.dart';
import 'grafic_widgets_components/card_info_widget.dart';
import 'grafic_widgets_components/grafic_category_widget.dart';
import 'grafic_widgets_components/media_month_widget.dart';

class GraficButtompag extends StatefulWidget {
  const GraficButtompag({Key? key}) : super(key: key);

  @override
  State<GraficButtompag> createState() => _GraficButtompagState();
}

class _GraficButtompagState extends State<GraficButtompag> {
  final GraficController _graficController = GraficController();
  final HomeController _homeController = HomeController();
  bool load = false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {
          load = true;
        }));
    super.initState();
    _homeController.addListener(() {
      setState(() {});
    });
    _homeController.getMoney(key: keyUserMoney);
    _graficController.listcategory.addListener(() {
      setState(() {});
    });
    _graficController.despesas.addListener(() {
      setState(() {});
    });
    _graficController.saldo.addListener(() {
      setState(() {});
    });
    _graficController.state.addListener(() {
      setState(() {});
    });

    _homeController.getevetList(key: keyList).then((value) => {
          _graficController.sumValue(
              eventos: _homeController.value,
              userSaldo: _homeController.userMoney.value!)
        });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return !load
        ? const LoadWidget(
            comunic: "Carregando dados..",
          )
        : Scaffold(
            body: Container(
              width: width,
              height: height,
              color: Colors.white,
              child: SingleChildScrollView(
                  child: Column(
                spacing: height * 0.01,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CardInfoWidget(
                              state: _graficController.state.value,
                              icon: Icons.attach_money_rounded,
                              nameinfo: 'Saldo',
                              valueinfo: _graficController.saldo.value),
                          CardInfoWidget(
                            state: _graficController.state.value,
                            icon: Icons.arrow_downward_rounded,
                            nameinfo: 'Dividas',
                            valueinfo: _graficController.despesas.value,
                          )
                        ],
                      )),
                  const GraficCategoryWidget(),
                  const MediaMonthWidget(),
                ],
              )),
            ),
          );
  }
}

import 'package:flutter/material.dart';
import 'package:my_money/view/screens/page_details/pages_buttombar/wallet_page/wallet_controller.dart';
import 'package:my_money/view/screens/page_details/pages_buttombar/wallet_page/wallet_widget_components/resume_card.dart';
import 'package:my_money/view/screens/page_details/pages_buttombar/wallet_page/wallet_widget_components/card_payment_widget.dart';
import 'package:my_money/view/screens/page_details/pages_buttombar/wallet_page/wallet_widget_components/last_events_widget.dart';

import '../../../../../model/shared_preferences.dart';
import '../../../home_page/home_controller.dart';

class WalletButtompage extends StatefulWidget {
  const WalletButtompage({Key? key}) : super(key: key);

  @override
  State<WalletButtompage> createState() => _WalletButtompageState();
}

class _WalletButtompageState extends State<WalletButtompage> {
  final WalletController _walletcontroller = WalletController();
  final HomeController _homecontroller = HomeController();
  @override
  void initState() {
    super.initState();

    _walletcontroller.despesas.addListener(() {
      setState(() {});
    });
    _homecontroller.addListener(() {
      setState(() {});
    });
    _homecontroller.getevetList(key: keyList).then((value) => {
          _walletcontroller.sumValue(eventos: _homecontroller.value),
          _walletcontroller.sumtrasation(eventos: _homecontroller.value)
        });
    _homecontroller.getMoney(key: keyUserMoney);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: const Color(0xFF2E4159),
        width: width,
        height: height,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                    color: Color(0xff5F5DA6),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22))),
                width: width,
                height: height * 0.8,
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.27,
                    ),
                    const LastEventsWidget(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Pagamentos',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: height * 0.022),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.96,
                      height: height * 0.15,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardPaymentWidget(
                            icon: Icons.attach_money_rounded,
                            eventnumber: '3',
                            namepayment: 'Dinheiro',
                            value: '300',
                          ),
                          CardPaymentWidget(
                            icon: Icons.credit_card_rounded,
                            eventnumber: '1',
                            namepayment: 'Cartão',
                            value: '2000',
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ResumeCardWidget(
                dispesas: _walletcontroller.despesas.value,
                saldoucont: _homecontroller.userMoney.value!),
            Positioned(
                top: 20,
                left: width * 0.353,
                // right: width * 0.3,
                child: SizedBox(
                  child: Text('Carteira',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: height * 0.04)),
                ))
          ],
        ),
      ),
    );
  }
}

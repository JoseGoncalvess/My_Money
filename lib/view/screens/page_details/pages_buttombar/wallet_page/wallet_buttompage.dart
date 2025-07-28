import 'package:flutter/material.dart';
import 'package:my_money/view/screens/page_details/pages_buttombar/wallet_page/wallet_controller.dart';
import 'package:my_money/view/screens/page_details/pages_buttombar/wallet_page/wallet_widget_components/resume_card.dart';
import 'package:my_money/view/screens/page_details/pages_buttombar/wallet_page/wallet_widget_components/card_payment_widget.dart';
import 'package:my_money/view/screens/page_details/pages_buttombar/wallet_page/wallet_widget_components/last_events_widget.dart';

import '../../../../../model/shared_preferences.dart';
import '../../../home_page/home_controller.dart';

class WalletButtompage extends StatefulWidget {
  const WalletButtompage({super.key});

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
    _walletcontroller.trasationcard.addListener(() {
      setState(() {});
    });
    _walletcontroller.trasationmoney.addListener(() {
      setState(() {});
    });

    _homecontroller.getevetList(key: keyList).then((value) => {
          _walletcontroller.sumValue(eventos: _homecontroller.value),
          _walletcontroller.sumtrasation(eventos: _homecontroller.value),
        });
    _homecontroller.getMoney(key: keyUserMoney);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: const Color(0xFF2E4159),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            spacing: 10,
            children: [
              ResumeCardWidget(
                  dispesas: _walletcontroller.despesas.value,
                  saldoucont: _homecontroller.userMoney.value!),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22))),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.555,
                child: Column(
                  spacing: 10,
                  children: [
                    LastEventsWidget(),
                    Text(
                      'Pagamentos',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: MediaQuery.of(context).size.height * 0.022),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.13,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          CardPaymentWidget(
                            trasitioninfo:
                                _walletcontroller.trasationmoney.value,
                            icon: Icons.attach_money_rounded,
                            namepayment: 'Dinheiro',
                          ),
                          CardPaymentWidget(
                            icon: Icons.credit_card_rounded,
                            namepayment: 'Cartão',
                            trasitioninfo:
                                _walletcontroller.trasationcard.value,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

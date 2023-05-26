import 'package:flutter/material.dart';
import 'package:my_money/page/screens/pagedetails/pages_buttombar/wallet_widget_components/Resume_card_widget.dart';
import 'package:my_money/page/screens/pagedetails/pages_buttombar/wallet_widget_components/card_payment_widget.dart';
import 'package:my_money/page/screens/pagedetails/pages_buttombar/wallet_widget_components/last_events_widget.dart';

class WalletButtompage extends StatelessWidget {
  const WalletButtompage({Key? key}) : super(key: key);

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
                    color: const Color(0xff5F5DA6),
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
                    LastEventsWidget(),
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
            ResumeCardWidget(),
            Positioned(
                top: 20,
                left: width * 0.353,
                // right: width * 0.3,
                child: Container(
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

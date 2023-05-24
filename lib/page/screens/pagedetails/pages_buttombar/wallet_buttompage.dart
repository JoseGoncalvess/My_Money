import 'package:flutter/material.dart';

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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Ultimas Movimentações',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: height * 0.025),
                      ),
                    ),
                    Container(
                      width: width * 0.9,
                      height: height * 0.27,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                    ),
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
                    Container(
                      width: width * 0.96,
                      height: height * 0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: width * 0.4,
                            height: height * 0.15,
                            decoration: BoxDecoration(
                                color: const Color(0xFF2E4159),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.attach_money_rounded,
                                      size: width * 0.08,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Dinheiro:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: height * 0.023),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'R\$ 0',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.019),
                                    ),
                                    Text(
                                      'Transações: 1',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.019),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.4,
                            height: height * 0.15,
                            decoration: BoxDecoration(
                                color: const Color(0xFF2E4159),
                                borderRadius: BorderRadius.circular(12)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.credit_card_rounded,
                                      size: width * 0.08,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Cartão:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: height * 0.023),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'R\$ 0',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.019),
                                    ),
                                    Text(
                                      'Transações: 1',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: height * 0.019),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                top: 60,
                right: 50,
                left: 50,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22)),
                  width: width * 0.6,
                  height: height * 0.2,
                  child: Column(
                    children: [
                      SizedBox(
                        width: width * 0.78,
                        height: height * 0.1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Saldo em Conta:',
                                  style: TextStyle(
                                      color: const Color(0xff5F5DA6),
                                      fontWeight: FontWeight.w700,
                                      fontSize: height * 0.022),
                                ),
                                Text(
                                  'R\$ 3000',
                                  style: TextStyle(
                                      color: const Color(0xff5F5DA6),
                                      fontWeight: FontWeight.w500,
                                      fontSize: height * 0.019),
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Despesas:',
                                  style: TextStyle(
                                      color: const Color(0xff5F5DA6),
                                      fontWeight: FontWeight.w600,
                                      fontSize: height * 0.022),
                                ),
                                Text(
                                  'R\$ 3000',
                                  style: TextStyle(
                                      color: const Color(0xff5F5DA6),
                                      fontWeight: FontWeight.w500,
                                      fontSize: height * 0.019),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          '- - - - - - - - - - ',
                          style: TextStyle(
                              color: const Color(0xff5F5DA6),
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.03),
                        ),
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Novo Evento ',
                              style: TextStyle(
                                  color: const Color(0xff5F5DA6),
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * 0.02),
                            ),
                            IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.add_circle_rounded,
                                  color: const Color(0xff5F5DA6),
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            Positioned(
                top: 20,
                left: width * 0.4,
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

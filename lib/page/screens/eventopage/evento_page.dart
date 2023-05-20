import 'package:flutter/material.dart';
import 'package:my_money/page/screens/eventopage/parcela_widget.dart';
import 'package:my_money/page/screens/eventopage/payment_category_widget.dart';
import 'package:my_money/page/screens/eventopage/row_infoform_widget.dart';
import 'package:my_money/page/widgets/buttom_custom_widget.dart';
import 'package:my_money/page/widgets/custom_formfiel_widget.dart';

import '../../widgets/logo_inline_widget.dart';
import 'category_event_widget.dart';

class EventoPage extends StatefulWidget {
  const EventoPage({super.key});

  @override
  State<EventoPage> createState() => _EventoPageState();
}

class _EventoPageState extends State<EventoPage> with TickerProviderStateMixin {
  TextEditingController eventoController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  int parcel = 12;
  String pvalue = '';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: width,
          height: height,
          color: const Color(0xFF2E4159),
          child: Stack(children: [
            SizedBox(
              // color: Colors.red,
              height: height * 0.18,
              width: width,
              child: const LogoInlineWidget(fontsiz: 0.05, imagescale: 3),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                width: width,
                height: height * 0.84,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Column(
                  children: [
                    Text(
                      'Detalhes da Despesa',
                      style: TextStyle(
                          color: const Color(0xff5F5DA6),
                          fontSize: width * 0.08,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Evento:',
                      style: TextStyle(
                          color: const Color(0xFF2E4159),
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: width * 0.88,
                      child: CustomFormfielWidget(
                        internlabel: 'Nome do Evento',
                        keybordtype: TextInputType.name,
                        controller: eventoController,
                        cortext: Colors.white,
                        backgrou: const Color(0xff4F4D8C),
                        border: Colors.white,
                      ),
                    ),
                    RowInfoformWidget(
                      valorController: valorController,
                    ),
                    const CategoryEventWidget(),
                    Container(
                      width: width,
                      height: height * 0.19,
                      // color: Colors.blueGrey,
                      child: Column(
                        children: [
                          Text('Pagamento',
                              style: TextStyle(
                                  color: const Color(0xff4F4D8C),
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.w700)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // color: Colors.amber,
                                width: width * 0.5,
                                height: height * 0.15,
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    PaymentCategoryWidget(
                                      icon: Icons.credit_card_rounded,
                                      name: 'Cartão',
                                    ),
                                    PaymentCategoryWidget(
                                      icon: Icons.payments_rounded,
                                      name: 'Cartão',
                                    )
                                  ],
                                ),
                              ),
                              const ParcelaWidget(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width * 0.6,
                        height: height * 0.08,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: ButtomCustomWidget(
                            name: 'Salvar',
                            onpressed: () {},
                            backgroud: const Color(0xff4F4D8C),
                            colortext: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width * 0.4,
                        height: height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: ButtomCustomWidget(
                            name: 'Cancelar',
                            onpressed: () {},
                            backgroud: const Color(0xFF2E4159),
                            colortext: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}

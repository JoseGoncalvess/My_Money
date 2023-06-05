import 'package:flutter/material.dart';
import 'package:my_money/controller/interface_data.dart';
import 'package:my_money/controller/parcela_controller.dart';
import 'package:my_money/page/screens/eventopage/parcela_widget.dart';
import 'package:my_money/page/screens/eventopage/payment_category_widget.dart';
import 'package:my_money/page/screens/home/home_page.dart';
import 'package:my_money/page/widgets/buttom_custom_widget.dart';
import '../../../controller/repositories/repository_data.dart';
import '../../widgets/logo_inline_widget.dart';
import 'form_event_widget.dart';

class EventoPage extends StatefulWidget {
  const EventoPage({super.key});

  @override
  State<EventoPage> createState() => _EventoPageState();
}

class _EventoPageState extends State<EventoPage> with TickerProviderStateMixin {
  final PageController _pagecontrollecat = PageController();
  final GlobalKey<FormState> _keyevent = GlobalKey<FormState>();
  final TextEditingController _eventoController = TextEditingController();
  final TextEditingController _valorController = TextEditingController();
  bool payment = false;
  late String paymenttype = 'Dinheiro';

  ParcelaController parcelcontroller = ParcelaController();

  @override
  void initState() {
    parcelcontroller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    parcelcontroller.dispose();

    super.dispose();
  }

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
              child: const LogoInlineWidget(fontsiz: 0.05, imagescale: 4),
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
                child: SingleChildScrollView(
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
                      Form(
                        key: _keyevent,
                        child: FormEventWidget(
                            PagecontrollerCat: _pagecontrollecat,
                            eventocontroller: _eventoController,
                            valuecontroller: _valorController),
                      ),
                      SizedBox(
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
                                SizedBox(
                                  // color: Colors.amber,
                                  width: width * 0.5,
                                  height: height * 0.15,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      PaymentCategoryWidget(
                                        color: payment
                                            ? const Color(0xFF2E4159)
                                            : const Color(0xff4F4D8C),
                                        icon: Icons.credit_card_rounded,
                                        name: 'Dinheiro',
                                        onpressed: () {
                                          setState(() {
                                            payment = false;
                                          });
                                        },
                                      ),
                                      PaymentCategoryWidget(
                                        color: payment
                                            ? const Color(0xff4F4D8C)
                                            : const Color(0xFF2E4159),
                                        icon: Icons.payments_rounded,
                                        name: 'Cartão',
                                        onpressed: () {
                                          setState(() {
                                            paymenttype = 'Cartão';
                                            payment = true;
                                          });
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                payment == true
                                    ? ParcelaWidget(
                                        parcelaController: parcelcontroller,
                                        pacelValue:
                                            parcelcontroller.value.toString(),
                                      )
                                    : Container(),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          width: width * 0.6,
                          height: height * 0.08,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15)),
                          child: ButtomCustomWidget(
                              largura: 0.6,
                              altura: 0.08,
                              name: 'Salvar',
                              onpressed: () {
                                int cat = _pagecontrollecat.page!.round();

                                if (_keyevent.currentState!.validate()) {
                                  RepositoryData()
                                      .onSaveEvent(
                                          nameEvent: _eventoController.text,
                                          dateEvent: '24/03/2020',
                                          velueEvent: _valorController.text,
                                          categoryEvent: InterfaceData()
                                              .categoryIcons[cat][IconData],
                                          paymentEvent: paymenttype,
                                          parcelEvnet:
                                              parcelcontroller.value.toString())
                                      .then((value) =>
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomePage(
                                                        eventos: [],
                                                      ))));
                                }
                              },
                              backgroud: const Color(0xff4F4D8C),
                              colortext: Colors.white),
                        ),
                      ),
                      ButtomCustomWidget(
                          altura: 0.045,
                          largura: 0.4,
                          name: 'Cancelar',
                          onpressed: () => Navigator.pop(context),
                          backgroud: const Color(0xFF2E4159),
                          colortext: Colors.white)
                    ],
                  ),
                ),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}

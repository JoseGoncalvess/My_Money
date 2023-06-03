import 'package:flutter/material.dart';
import 'package:my_money/controller/interface_data.dart';

import '../../../widgets/container_faq_widget.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key? key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  late int _currentindex = 0;
  bool opendor = false;

  late List<Map> faqTypes;
  @override
  void initState() {
    faqTypes = InterfaceData().faqTypes;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff5F5DA6),
        title: const Text('Perguntas Frequentes'),
      ),
      body: Container(
          width: width,
          height: height,
          color: const Color(0xFF2E4159),
          child: ListView.builder(
            itemCount: faqTypes.length,
            itemBuilder: (context, i) {
              bool select = _currentindex == i;
              return ContainerFaqWidget(
                doubt: faqTypes[i]['doubt'],
                ress: faqTypes[i]['res'],
                onpressed: () => setState(() {
                  _currentindex = i;
                }),
                onselect: select,
              );
            },
          )),
    );
  }
}

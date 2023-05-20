import 'package:flutter/material.dart';

import '../../widgets/custom_formfiel_widget.dart';

class RowInfoformWidget extends StatelessWidget {
  final TextEditingController valorController;
  const RowInfoformWidget({Key? key, required this.valorController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.98,
      height: height * 0.12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Data:',
                style: TextStyle(
                    color: const Color(0xff5F5DA6),
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.4,
                height: height * 0.074,
                decoration: BoxDecoration(
                    color: const Color(0xff4F4D8C),
                    borderRadius: BorderRadius.circular(4)),
                child: const Text(
                  'Data',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'valor R\$:',
                style: TextStyle(
                    color: const Color(0xff5F5DA6),
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w700),
              ),
              Container(
                alignment: Alignment.center,
                width: width * 0.4,
                height: height * 0.08,
                child: CustomFormfielWidget(
                    internlabel: 'valor',
                    keybordtype: TextInputType.number,
                    controller: valorController,
                    cortext: Colors.white,
                    backgrou: const Color(0xff4F4D8C),
                    border: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

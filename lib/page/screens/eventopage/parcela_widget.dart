import 'package:flutter/material.dart';

class ParcelaWidget extends StatefulWidget {
  const ParcelaWidget({super.key});

  @override
  State<ParcelaWidget> createState() => _ParcelaWidgetState();
}

class _ParcelaWidgetState extends State<ParcelaWidget> {
  int parcel = 12;
  String pvalue = '1x';
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      // color: Colors.red,
      width: width * 0.5,
      height: height * 0.15,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    content: SingleChildScrollView(
                      child: SizedBox(
                        height: height * 0.5,
                        width: width * 0.03,
                        child: ListView.builder(
                          itemCount: parcel,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              setState(() {
                                pvalue = '$index x';
                                Navigator.pop(context);
                              });
                            },
                            child: ListTile(
                              title: Center(
                                child: Text('$index x',
                                    style: TextStyle(
                                        color: const Color(0xFF2E4159),
                                        fontSize: width * 0.05,
                                        fontWeight: FontWeight.w700)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              alignment: Alignment.center,
              width: width * 0.4,
              height: height * 0.074,
              decoration: BoxDecoration(
                  color: const Color(0xff4F4D8C),
                  borderRadius: BorderRadius.circular(4)),
              child: Text(
                pvalue,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.w700),
              ),
            ),
          )
        ],
      ),
    );
  }
}

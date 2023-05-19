import 'package:flutter/material.dart';

import 'animated_details_widget.dart';

class MonthPageDetails extends StatefulWidget {
  const MonthPageDetails({super.key});

  @override
  State<MonthPageDetails> createState() => _MonthPageDetailsState();
}

class _MonthPageDetailsState extends State<MonthPageDetails>
    with TickerProviderStateMixin {
  late TabController tabcontroller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabcontroller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabcontroller.dispose();
  }

  bool animated = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4F4D8C),
        title: const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text('Eventos de Janeiro'),
        ),
      ),
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              child: PageView(
                children: [
                  Container(
                    color: Colors.amber,
                  ),
                  Container(
                    color: Colors.red,
                  ),
                  Container(
                    color: Colors.green,
                  )
                ],
              ),
            ),
            const AnimatedDetailsWidget()
          ],
        ),
      ),
    );
  }
}

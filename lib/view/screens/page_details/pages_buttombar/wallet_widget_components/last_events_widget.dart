import 'package:flutter/material.dart';

class LastEventsWidget extends StatelessWidget {
  const LastEventsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Column(
      children: [
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
          height: height * 0.25,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(12)),
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                width: width * 0.3,
                height: height * 0.1,
                color: const Color.fromARGB(255, 87, 15, 99),
                child: Text(
                  'evento $index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

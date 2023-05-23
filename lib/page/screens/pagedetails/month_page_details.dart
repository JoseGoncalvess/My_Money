import 'package:flutter/material.dart';

class MonthPageDetails extends StatefulWidget {
  const MonthPageDetails({super.key});

  @override
  State<MonthPageDetails> createState() => _MonthPageDetailsState();
}

class _MonthPageDetailsState extends State<MonthPageDetails> {
  int _currenteindex = 0;
  final List<Widget> tab = <Widget>[
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
    )
  ];

  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff4F4D8C),
          title: const Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Text('Financeiro Detalhado'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xff4F4D8C),
          currentIndex: _currenteindex,
          items: [
            BottomNavigationBarItem(
                label: 'Carteira', icon: Icon(Icons.wallet_rounded)),
            BottomNavigationBarItem(
                label: 'Dealhes', icon: Icon(Icons.list_rounded)),
            BottomNavigationBarItem(
                label: 'Graficos', icon: Icon(Icons.pie_chart_rounded))
          ],
          onTap: (index) {
            setState(() {
              _currenteindex = index;
            });
          },
        ),
        body: tab.elementAt(_currenteindex));
  }
}

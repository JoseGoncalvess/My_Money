import 'package:flutter/material.dart';
import 'package:my_money/page/screens/pagedetails/pages_buttombar/detail_buttompage.dart';
import 'package:my_money/page/screens/pagedetails/pages_buttombar/grafic_buttompag.dart';
import 'package:my_money/page/screens/pagedetails/pages_buttombar/wallet_buttompage.dart';

class MonthPageDetails extends StatefulWidget {
  const MonthPageDetails({super.key});

  @override
  State<MonthPageDetails> createState() => _MonthPageDetailsState();
}

class _MonthPageDetailsState extends State<MonthPageDetails> {
  int _currenteindex = 0;
  final List<Widget> tab = <Widget>[
    const WalletButtompage(),
    const DetailButtompage(),
    const GraficButtompag(),
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
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
          elevation: 1,
          iconSize: height * 0.035,
          unselectedIconTheme: IconThemeData(
            color: Color.fromARGB(255, 178, 182, 186),
            size: height * 0.025,
          ),
          selectedItemColor: Colors.white,
          selectedFontSize: height * 0.02,
          backgroundColor: const Color(0xff4F4D8C),
          currentIndex: _currenteindex,
          items: [
            BottomNavigationBarItem(
                tooltip: 'Seus Saldos',
                label: 'Carteira',
                icon: Icon(Icons.wallet_rounded)),
            BottomNavigationBarItem(
                tooltip: 'Suas Movimentações',
                label: 'Dealhes',
                icon: Icon(Icons.list_rounded)),
            BottomNavigationBarItem(
                tooltip: 'Analise Dos Dados',
                label: 'Graficos',
                icon: Icon(Icons.pie_chart_rounded))
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

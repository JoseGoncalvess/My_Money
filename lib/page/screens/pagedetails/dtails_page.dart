import 'package:flutter/material.dart';
import 'package:my_money/page/screens/pagedetails/pages_buttombar/detail_buttompage.dart';
import 'package:my_money/page/screens/pagedetails/pages_buttombar/grafic_buttompag.dart';
import 'package:my_money/page/screens/pagedetails/pages_buttombar/wallet_buttompage.dart';

class DtailsPage extends StatefulWidget {
  const DtailsPage({
    super.key,
  });

  @override
  State<DtailsPage> createState() => _DtailsPageState();
}

class _DtailsPageState extends State<DtailsPage> {
  int _currenteindex = 0;
  late PageController controler;
  int initialPage = 0;
  @override
  void initState() {
    controler = PageController(viewportFraction: 0.4, initialPage: initialPage);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tab = [
      const WalletButtompage(),
      DetailButtompage(pagecontroller: controler),
      const GraficButtompag(),
    ];
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
            color: const Color.fromARGB(255, 178, 182, 186),
            size: height * 0.025,
          ),
          selectedItemColor: Colors.white,
          selectedFontSize: height * 0.02,
          backgroundColor: const Color(0xff4F4D8C),
          currentIndex: _currenteindex,
          items: const [
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

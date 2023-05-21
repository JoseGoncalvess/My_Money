import 'package:flutter/material.dart';
import 'package:my_money/page/screens/home/pagedrawer/editing_perfil.dart';
import 'package:my_money/page/screens/home/pagedrawer/faq_page.dart';
import 'package:my_money/page/screens/home/pagedrawer/suport_page.dart';

class ListDrawerWidget extends StatefulWidget {
  const ListDrawerWidget({Key? key}) : super(key: key);

  @override
  State<ListDrawerWidget> createState() => _ListDrawerWidgetState();
}

class _ListDrawerWidgetState extends State<ListDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return SafeArea(
      child: SizedBox(
        height: height * 0.78,
        child: Column(
          children: [
            Container(
              width: width,
              height: height * 0.1,
              // color: Colors.white,
              child: Center(
                child: Text(
                  'Ola, Sr. Gonçalves!',
                  style: TextStyle(
                      fontSize: width * 0.03, fontWeight: FontWeight.w400),
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditingPerfil(
                          name: 'gonçlaves',
                          profileimg: 'assets/img/sem_logo.jpg',
                          totalmoney: '2000'),
                    ));
              },
              leading: const Icon(
                Icons.person_outline_rounded,
                size: 28,
              ),
              title: const Text('Perfi',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuportPage(),
                    ));
              },
              leading: const Icon(
                Icons.support_agent_rounded,
                size: 28,
              ),
              title: const Text('Suporte',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white)),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FaqPage(),
                    ));
              },
              leading: const Icon(
                Icons.help_outline_rounded,
                size: 28,
              ),
              title: const Text('FAQ',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

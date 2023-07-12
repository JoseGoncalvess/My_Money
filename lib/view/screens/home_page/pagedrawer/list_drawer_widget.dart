import 'package:flutter/material.dart';
import 'package:my_money/view/screens/home_page/pagedrawer/editing_perfil.dart';
import 'package:my_money/view/screens/home_page/pagedrawer/faq_page.dart';
import 'package:my_money/view/screens/home_page/pagedrawer/suport_page/suport_page.dart';

class ListDrawerWidget extends StatefulWidget {
  final String nameUser;
  final String moneyUser;
  final String versioApp;
  const ListDrawerWidget(
      {Key? key,
      required this.nameUser,
      required this.moneyUser,
      required this.versioApp})
      : super(key: key);

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
                  'Ola, Sr(a). ${widget.nameUser}!',
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
                          name: widget.nameUser,
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
                      builder: (context) => const SuportPage(),
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
                      builder: (context) => const FaqPage(),
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
            SizedBox(
              height: height * 0.61,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Versão: ${widget.versioApp}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white)),
                Icon(
                  Icons.verified_user_outlined,
                  size: height * 0.04,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

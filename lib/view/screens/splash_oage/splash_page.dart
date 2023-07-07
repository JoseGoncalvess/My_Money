import 'package:flutter/material.dart';
import 'package:my_money/view/screens/user_page/create_perfil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const CreatePerfil(),
              ))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff4F4D8C),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Image.asset('assets/img/logo_splash.png')],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_money/model/shared_preferences.dart';
import 'package:my_money/view/screens/home_page/home_page.dart';
import 'package:my_money/view/screens/user_page/create_perfil.dart';
import '../../../controller/version_details.dart';
import '../user_page/user_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final UserController _userController = UserController();
  final VersionDetails _versionController = VersionDetails();
  @override
  void initState() {
    super.initState();
    _userController.lodUser(key: keyUsername);
    Future.delayed(const Duration(seconds: 2)).then((value) => {
          if (_userController.value)
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ))
            }
          else
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreatePerfil(),
                  ))
            }
        });
  }

  @override
  void dispose() {
    super.dispose();
    _versionController.dispose();
    _userController.dispose();
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

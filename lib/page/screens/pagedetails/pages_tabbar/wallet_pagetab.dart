import 'package:flutter/material.dart';

class WalletPagetab extends StatefulWidget {
  const WalletPagetab({Key? key}) : super(key: key);

  @override
  State<WalletPagetab> createState() => _WalletPagetabState();
}

class _WalletPagetabState extends State<WalletPagetab> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: width,
        height: height,
        child: Container(
          width: width * 0.5,
          height: height * 0.2,
          child: Column(
            children: [
              Text('Saldos'),
              Container(
                width: width * 0.5,
                height: height * 0.2,
                color: Colors.grey,
              )
            ],
          ),
        ),
      ),
    );
  }
}

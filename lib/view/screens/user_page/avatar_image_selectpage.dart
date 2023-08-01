import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/controller/interface_data.dart';
import 'package:my_money/model/shared_preferences.dart';
import '../../widgets/buttom_custom_widget.dart';
import 'avatar_select_components/avatar_select_controller.dart';
import 'avatar_select_components/card_avatar_select_widget.dart';

class AvatarImageSelectpage extends StatefulWidget {
  const AvatarImageSelectpage({Key? key}) : super(key: key);

  @override
  State<AvatarImageSelectpage> createState() => _AvatarImageSelectpageState();
}

class _AvatarImageSelectpageState extends State<AvatarImageSelectpage> {
  final PageController _pageController = PageController(viewportFraction: 0.6);
  final AvatarSelectController _Avatarcontroller = AvatarSelectController();

  int _currentepage = 0;
  late List<Map> slider;

  @override
  void initState() {
    super.initState();
    slider = InterfaceData().imageAvatr;
    _pageController.addListener(() {
      setState(() {
        _currentepage = _pageController.page!.round();
      });
    });

    _Avatarcontroller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff4F4D8C),
        title: const Text('Selecionar Avatar'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _Avatarcontroller.setAvtar(
                    key: tempavatar, avatar: slider[_currentepage]['img']);
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.check,
                size: 30,
              ))
        ],
      ),
      body: Container(
        color: const Color(0xff2E4159),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: slider.length,
                  itemBuilder: (_, i) {
                    var onselect = _currentepage == i;
                    return CardAvatarSelectWidget(
                      image: slider[i]['img'],
                      onselect: onselect,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                slider[_currentepage]['name'],
                style: TextStyle(
                    fontSize: height * 0.05, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
                width: width,
                height: height * 0.3,
                child: Text(slider[_currentepage]['content'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: height * 0.03))),
          ],
        ),
      ),
    );
  }
}

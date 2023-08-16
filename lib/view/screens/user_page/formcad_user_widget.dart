import 'package:flutter/material.dart';
import 'package:my_money/view/screens/user_page/widget/avatar_select.dart';
import 'package:my_money/view/widgets/buttom_custom_widget.dart';
import '../../../controller/interface_data.dart';
import '../../../model/avatar_data_model.dart';
import '../../../model/shared_preferences.dart';
import '../../widgets/avatar_profile_widget.dart';

import 'avatar_select_components/avatar_select_controller.dart';

import 'form_userd_profile_widget.dart';

class FormcadUserWidget extends StatefulWidget {
  const FormcadUserWidget({Key? key}) : super(key: key);

  @override
  State<FormcadUserWidget> createState() => _FormcadUserWidgetState();
}

class _FormcadUserWidgetState extends State<FormcadUserWidget> {
  final AvatarSelectController _avatarcontroller = AvatarSelectController();
  final PageController _pageController = PageController(viewportFraction: 0.6);

  late int currentepage = 0;
  late List<AvatarDataModel> slider;
  @override
  void initState() {
    super.initState();
    _avatarcontroller.addListener(() {
      setState(() {});
    });

    slider = InterfaceData().imageAvatr;
    _pageController.addListener(() {
      setState(() {
        currentepage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext contextt) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            'PERFIL',
            style:
                TextStyle(fontSize: height * 0.03, fontWeight: FontWeight.w800),
          ),
        ),
        InkWell(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: const Color(0xff4F4D8C),
                context: contextt,
                builder: (contextt) {
                  return SizedBox(
                    width: width,
                    height: height * 0.45,
                    child: Column(
                      children: [
                        Text(
                          'Selecione seu Avatar',
                          style: TextStyle(
                              fontSize: height * 0.04,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: width,
                          height: height * 0.3,
                          child: GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 5,
                            children: slider
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                          onTap: () {
                                            _avatarcontroller.setAvtar(
                                                avatar: e.img, key: tempavatar);
                                          },
                                          child: AvatarSelect(
                                              state: e.select, img: e.img)),
                                    ))
                                .toList(),
                          ),
                        ),
                        ButtomCustomWidget(
                            onpressed: () => Navigator.pop(context),
                            name: 'ok',
                            colortext: const Color(0xff4F4D8C),
                            backgroud: Colors.white,
                            largura: width * 0.001,
                            altura: height * 0.00007)
                      ],
                    ),
                  );
                },
              );
            },
            child: ValueListenableBuilder(
                valueListenable: _avatarcontroller,
                builder: (context, value, child) =>
                    AvatarProfileWidget(image: value))),
        FormUserdProfileWidget(avatar: _avatarcontroller.value),
      ],
    );
  }
}

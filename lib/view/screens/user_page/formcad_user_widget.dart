import 'package:flutter/material.dart';
import '../../../controller/interface_data.dart';
import '../../../model/shared_preferences.dart';
import '../../widgets/avatar_profile_widget.dart';
import 'avatar_image_selectpage.dart';
import 'avatar_select_components/avatar_select_controller.dart';
import 'avatar_select_components/card_avatar_select_widget.dart';
import 'form_userd_profile_widget.dart';

class FormcadUserWidget extends StatefulWidget {
  const FormcadUserWidget({Key? key}) : super(key: key);

  @override
  State<FormcadUserWidget> createState() => _FormcadUserWidgetState();
}

class _FormcadUserWidgetState extends State<FormcadUserWidget> {
  final AvatarSelectController _avatarcontroller = AvatarSelectController();
  final PageController _pageController = PageController(viewportFraction: 0.6);

  int _currentepage = 0;
  late List<Map> slider;
  @override
  void initState() {
    super.initState();
    _avatarcontroller.addListener(() {
      setState(() {});
    });
    _avatarcontroller.chekingAVtar(key: tempavatar);

    slider = InterfaceData().imageAvatr;
    _pageController.addListener(() {
      setState(() {
        _currentepage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
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
                context: context,
                builder: (context) {
                  return SizedBox(
                    width: width,
                    height: height * 0.4,
                    child: Column(
                      children: [
                        Text(
                          'Selecione seu Avatar',
                          style: TextStyle(fontSize: height * 0.04),
                        ),
                        Container(
                          // color: Colors.amber,
                          width: width,
                          height: height * 0.34,
                          child: GridView.count(
                            crossAxisCount: 3,
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 15,
                            children: slider
                                .map((e) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          _avatarcontroller.setAvtar(
                                              avatar: e['img'],
                                              key: tempavatar);
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                              image: DecorationImage(
                                                  image: AssetImage(e['img']))),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                        )
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
//  Container(
//                             color: Colors.amber,
//                             width: width,
//                             height: height * 0.3,
//                             child: PageView.builder(
//                                 controller: _pageController,
//                                 itemCount: slider.length,
//                                 itemBuilder: (_, i) {
//                                   var onselect = _currentepage == i;
//                                   return CardAvatarSelectWidget(
//                                     image: slider[i]['img'],
//                                     onselect: onselect,
//                                   );
//                                 }),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(3.0),
//                             child: Text(
//                               slider[_currentepage]['name'],
//                               style: TextStyle(
//                                   fontSize: height * 0.03,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                           SizedBox(
//                               width: width,
//                               height: height * 0.3,
//                               child: Text(slider[_currentepage]['content'],
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(fontSize: height * 0.03))),
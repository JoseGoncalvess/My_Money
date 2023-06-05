import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/controller/interface_data.dart';
import 'package:my_money/page/widgets/iconcategory_event_widget.dart';

class CategoryEventWidget extends StatefulWidget {
  final PageController PagecontrollerCat;

  const CategoryEventWidget({Key? key, required this.PagecontrollerCat})
      : super(key: key);

  @override
  State<CategoryEventWidget> createState() => _CategoryEventWidgetState();
}

class _CategoryEventWidgetState extends State<CategoryEventWidget> {
  bool arrowidicat = true;
  int _currentpage = 0;
  late List<Map> categoryEvent;
  @override
  void initState() {
    categoryEvent = InterfaceData().categoryIcons;
    widget.PagecontrollerCat.addListener(() {
      setState(() {
        _currentpage = widget.PagecontrollerCat.page!.round();
        log(_currentpage.toString());
      });

      if (_currentpage == 6) {
        setState(() {
          arrowidicat = false;
        });
      } else if (_currentpage == 0) {
        setState(() {
          arrowidicat = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        SizedBox(
            height: height * 0.2,
            width: width,
            child: PageView.builder(
                controller: widget.PagecontrollerCat,
                scrollDirection: Axis.vertical,
                itemCount: categoryEvent.length,
                itemBuilder: (context, i) {
                  bool onselect = _currentpage == i;
                  return IconcategoryEventWidget(
                      onselectd: onselect,
                      icon: categoryEvent[i][IconData],
                      namecategory: categoryEvent[i]['name'],
                      onpressed: () {});
                })),
        Positioned(
          top: 58,
          child: Container(
            child: IconButton(
                onPressed: () {
                  widget.PagecontrollerCat.jumpToPage(_currentpage - 1);
                },
                icon: Icon(
                  arrowidicat
                      ? Icons.arrow_downward_rounded
                      : Icons.arrow_upward_rounded,
                  color: const Color(0xFF2E4159),
                )),
          ),
        )
      ],
    );
  }
}

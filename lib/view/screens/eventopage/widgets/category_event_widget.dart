import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:my_money/controller/interface_data.dart';
import 'package:my_money/view/widgets/iconcategory_event_widget.dart';

import '../../../../model/category_event.dart';

class CategoryEventWidget extends StatefulWidget {
  final PageController pagecontrollerCat;

  const CategoryEventWidget({Key? key, required this.pagecontrollerCat})
      : super(key: key);

  @override
  State<CategoryEventWidget> createState() => _CategoryEventWidgetState();
}

class _CategoryEventWidgetState extends State<CategoryEventWidget> {
  bool arrowidicat = true;
  int _currentpage = 0;
  late List<CategoryEvent> categoryEvent;
  @override
  void initState() {
    categoryEvent = InterfaceData().category;
    widget.pagecontrollerCat.addListener(() {
      setState(() {
        _currentpage = widget.pagecontrollerCat.page!.round();
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
    return SizedBox(
        height: height * 0.2,
        width: width,
        child: PageView.builder(
            controller: widget.pagecontrollerCat,
            scrollDirection: Axis.horizontal,
            itemCount: categoryEvent.length,
            itemBuilder: (context, i) {
              bool onselect = _currentpage == i;
              return IconcategoryEventWidget(
                  onselectd: onselect,
                  icon: categoryEvent[i].icon,
                  namecategory: categoryEvent[i].name,
                  onpressed: () {});
            }));
  }
}

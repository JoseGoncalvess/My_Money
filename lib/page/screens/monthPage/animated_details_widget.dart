import 'package:flutter/material.dart';

class AnimatedDetailsWidget extends StatefulWidget {
  const AnimatedDetailsWidget({Key? key}) : super(key: key);

  @override
  State<AnimatedDetailsWidget> createState() => _AnimatedDetailsWidgetState();
}

class _AnimatedDetailsWidgetState extends State<AnimatedDetailsWidget> {
  bool animated = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Positioned(
        left: !animated ? 70 : 0,
        right: !animated ? 70 : 0,
        bottom: 0,
        child: GestureDetector(
          onTap: () {
            setState(() {
              animated = !animated;
            });
          },
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              decoration: BoxDecoration(
                color: !animated
                    ? const Color(0xff4F4D8C)
                    : const Color(0xFF2E4159),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(animated ? 50 : 80),
                  topRight: Radius.circular(animated ? 50 : 80),
                ),
              ),
              curve: Curves.easeInOutSine,
              height: !animated ? height * 0.07 : height * 0.5,
              width: !animated ? width * 0.3 : width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'DETALHES',
                    style: TextStyle(
                        fontSize: width * 0.06, fontWeight: FontWeight.w600),
                  ),
                  const Icon(Icons.keyboard_double_arrow_down)
                ],
              )),
        ));
  }
}

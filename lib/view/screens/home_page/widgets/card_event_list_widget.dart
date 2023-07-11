import 'package:flutter/material.dart';
import 'package:my_money/controller/formater_date/date_event.dart';

import '../../../../controller/formater_date/event_type.dart';

class CardEventListWidget extends StatefulWidget {
  final String eventName;
  final String eventData;
  final String eventValue;
  final IconData iconCategory;

  const CardEventListWidget({
    Key? key,
    required this.eventName,
    required this.eventData,
    required this.eventValue,
    required this.iconCategory,
  }) : super(key: key);

  @override
  State<CardEventListWidget> createState() => _CardEventListWidgetState();
}

class _CardEventListWidgetState extends State<CardEventListWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(9),
      child: Container(
        width: width * 0.8,
        height: height * 0.12,
        decoration: const BoxDecoration(
            color: Color(0xFF2E4159),
            borderRadius: BorderRadius.all(Radius.circular(22)),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.5,
                  color: Color(0xC1000000),
                  blurRadius: 1,
                  blurStyle: BlurStyle.normal,
                  offset: Offset(1, 5))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    decoration: BoxDecoration(
                      color: const Color(0xff5F5DA6),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      widget.iconCategory,
                      size: width * 0.09,
                      color: const Color(0xFFEBE9E9),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      EventType().getEvent(icon: widget.iconCategory),
                      style: TextStyle(
                          fontSize: height * 0.02, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      widget.eventName,
                      style: TextStyle(
                          fontSize: height * 0.023,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: width * 0.14,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateEvent().getdate(date: widget.eventData),
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: height * 0.02,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'R\$ ${widget.eventValue}',
                  style: TextStyle(
                      fontSize: height * 0.02, fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

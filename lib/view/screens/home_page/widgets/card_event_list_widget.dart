import 'package:flutter/material.dart';
import 'package:my_money/controller/helprs/formaters/formater_date/date_event.dart';
import 'package:my_money/controller/helprs/formaters/formater_value_payment.dart';

import '../../../../controller/helprs/formaters/formater_date/event_type.dart';

class CardEventListWidget extends StatefulWidget {
  final String eventName;
  final String eventData;
  final String eventValue;
  final IconData iconCategory;
  final Function optionpress;

  const CardEventListWidget({
    super.key,
    required this.eventName,
    required this.eventData,
    required this.eventValue,
    required this.iconCategory,
    required this.optionpress,
  });

  @override
  State<CardEventListWidget> createState() => _CardEventListWidgetState();
}

class _CardEventListWidgetState extends State<CardEventListWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: const EdgeInsets.all(8),
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
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.6170,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: width * 0.2,
                          height: height * 0.1,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xff5F5DA6),
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
                            widget.eventName,
                            style: TextStyle(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            EventType().getEvent(icon: widget.iconCategory),
                            style: TextStyle(
                                fontSize: width * 0.03,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateEvent().getdate(date: widget.eventData),
                      style: TextStyle(
                          color: const Color(0xB5FFFFFF),
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      FormaterValuePayment()
                          .viewValue(value: double.parse(widget.eventValue)),
                      style: TextStyle(
                          fontSize: width * 0.04, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                IconButton(
                    onPressed: () {
                      widget.optionpress();
                    },
                    icon: const Icon(Icons.more_vert_rounded))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

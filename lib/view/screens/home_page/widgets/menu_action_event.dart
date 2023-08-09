import 'package:flutter/material.dart';

class MenuActionEvent {
  Future showButtomSheet({
    required BuildContext context,
    required String nameEvent,
    required Function edidtingFunction,
    required Function deletFunction,
  }) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return showModalBottomSheet(
      elevation: 0,
      backgroundColor: Color(0x00000000).withOpacity(0.1),
      context: context,
      builder: (context) => Container(
        height: height * 0.3,
        width: width,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: height * 0.05,
                  color: Colors.grey,
                )),
            Icon(
              Icons.event,
              size: height * 0.08,
              color: const Color(0xff5F5DA6),
            ),
            Text(
              textAlign: TextAlign.center,
              'O evento Evento $nameEvent foi Selecionado',
              style: TextStyle(
                  color: const Color(0xFF354B66),
                  fontWeight: FontWeight.w500,
                  fontSize: height * 0.03),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: width * 0.35,
                    height: height * 0.06,
                    child: ElevatedButton(
                        style: const ButtonStyle(),
                        onPressed: () {
                          edidtingFunction();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Editar',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: width * 0.35,
                    height: height * 0.06,
                    child: ElevatedButton(
                        onPressed: () {
                          deletFunction();
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Excluir',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

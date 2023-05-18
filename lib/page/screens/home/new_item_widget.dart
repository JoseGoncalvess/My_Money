import 'package:flutter/material.dart';

class NewItemWidget extends StatelessWidget {
  const NewItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.note_add_rounded,
          size: 130,
          color: Color(0xFF2E4159),
        ),
        Text('Adicione Novos  Eventos',
            style: TextStyle(
                color: const Color(0xff5F5DA6),
                fontWeight: FontWeight.bold,
                fontSize: height * 0.03))
      ],
    );
  }
}

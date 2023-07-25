import 'package:flutter/material.dart';

class CustomAlert extends StatelessWidget {
  final String mensseger;
  final IconData icon;

  const CustomAlert({super.key, required this.mensseger, required this.icon});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300], borderRadius: BorderRadius.circular(22)),
        width: width,
        height: height * 0.02,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: height * 0.08, color: const Color(0xff5F5DA6)),
            Text(
              mensseger,
              style: TextStyle(
                  color: const Color.fromARGB(255, 63, 82, 92),
                  fontSize: height * 0.03),
            )
          ],
        ),
      ),
    );
  }
}

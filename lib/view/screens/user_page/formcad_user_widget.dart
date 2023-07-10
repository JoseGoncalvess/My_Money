import 'package:flutter/material.dart';
import '../../widgets/avatar_profile_widget.dart';
import 'avatar_image_selectpage.dart';
import 'form_userd_profile_widget.dart';

class FormcadUserWidget extends StatefulWidget {
  const FormcadUserWidget({Key? key}) : super(key: key);

  @override
  State<FormcadUserWidget> createState() => _FormcadUserWidgetState();
}

class _FormcadUserWidgetState extends State<FormcadUserWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AvatarImageSelectpage(),
                  ));
            },
            child: const AvatarProfileWidget(image: 'assets/img/sem_logo.jpg')),
        const FormUserdProfileWidget(),
      ],
    );
  }
}

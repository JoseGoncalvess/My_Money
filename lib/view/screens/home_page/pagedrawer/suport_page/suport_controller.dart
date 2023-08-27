import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SuportController {
  //FUNÇÃO FUTURA QUE EXECUTA A URL
  emailLaucher(
      {required BuildContext context,
      required String assunto,
      required String corpo}) async {
    String email = Uri.encodeComponent('suport.deveopper@gmail.com');
    String subject = Uri.encodeComponent(assunto);
    String body = Uri.encodeComponent(corpo);
    //TRSNFORMO EM TIPO "URI" JA PASSANDO O CORPO DO TIPO EMAIL SEGUINDO A ESTRUTURA DO URI
    Uri url = Uri.parse("mailto:$email?subject=$subject&body=$body");
    //EXECUTO ENVIO TRAVEZ DO APP EMAIL
    await launchUrl(url, mode: LaunchMode.externalApplication).then((value) => {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.white,
              actionsAlignment: MainAxisAlignment.center,
              title: Icon(
                Icons.check_circle_outline,
                color: const Color(0xff5F5DA6),
                size: MediaQuery.sizeOf(context).height * 0.1,
              ),
              content: const Text(
                'Feedback enviado com sucesso, obrigado por contribuir!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xff5F5DA6), fontWeight: FontWeight.w400),
              ),
              actions: [
                ElevatedButton(
                    style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(
                            MediaQuery.sizeOf(context).width * 0.4,
                            MediaQuery.sizeOf(context).height * 0.05)),
                        backgroundColor: const MaterialStatePropertyAll<Color>(
                            Color(0xff5F5DA6))),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
          )
        });
  }
}

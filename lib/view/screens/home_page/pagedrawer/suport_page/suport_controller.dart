import 'package:url_launcher/url_launcher.dart';

class SuportController {
  //FUNÇÃO FUTURA QUE EXECUTA A URL
  emailLaucher({required String assunto, required String corpo}) async {
    String email = Uri.encodeComponent('joseinacoi774@gmail.com');
    String subject = Uri.encodeComponent(assunto);
    String body = Uri.encodeComponent(corpo);
    //TRSNFORMO EM TIPO "URI" JA PASSANDO O CORPO DO TIPO EMAIL SEGUINDO A ESTRUTURA DO URI
    Uri url = Uri.parse("mailto:$email?subject=$subject&body=$body");
    //EXECUTO ENVIO TRAVEZ DO APP EMAIL
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}

import 'package:flutter/material.dart';

class InterfaceData {
  List<Map> categoryIcons = [
    {'id': 0, 'name': 'Ferias', IconData: Icons.luggage_rounded},
    {'id': 1, 'name': 'Lazer', IconData: Icons.park_rounded},
    {'id': 2, 'name': 'Investimento', IconData: Icons.auto_graph_rounded},
    {'id': 3, 'name': 'Viagem', IconData: Icons.flight_rounded},
    {'id': 4, 'name': 'Saúde', IconData: Icons.medical_services_rounded},
    {'id': 5, 'name': 'Alimentação', IconData: Icons.restaurant_rounded},
    {'id': 6, 'name': 'Trabalho', IconData: Icons.work},
  ];

  List<Map> paymentIcons = [
    {
      'id': 0,
      'name': 'Cartão',
      IconData: Icons.credit_card_rounded,
    },
    {
      'id': 1,
      'name': 'Dinehiro',
      IconData: Icons.payments_rounded,
    },
  ];
  List<Map> imageAvatr = [
    {
      'id': 0,
      'img': 'assets/img/bitcoin.png',
      'name': 'Bitconin',
      'content': "O bitcoin é uma moeda virtual a primeira criada no mundo."
    },
    {
      'id': 1,
      'img': 'assets/img/caramelo.png',
      'name': 'Cachorro Caramelo',
      'content': 'Criptomoeda brasileira foi criada para ser um meme'
    },
    {
      'id': 3,
      'img': 'assets/img/ethereum.png',
      'name': 'Hetereum',
      'content':
          'O Ethereum, assim como o Bitcoin, é uma blockchain que permite a transferência de criptomoedas entre indivíduos sem a necessidade de uma terceira parte'
    },
    {
      'id': 4,
      'img': 'assets/img/lobo.png',
      'name': 'Lobo de Wall Street',
      'content':
          'Jordan Belfort é um ambicioso corretor da bolsa de valores que cria um verdadeiro império, enriquecendo de forma rápida, porém ilegal.'
    }
  ];

  List<Map> faqTypes = [
    {
      'doubt': 'Quem criou o App?',
      'res': 'Criado Para fins didatico, de um Desenvolvedor Legal ai!.'
    },
    {
      'doubt': 'O aplicativo é seguro ?',
      'res':
          'Toda e qualquer informação  inserida no app, está armazenada no dispositivo sem qualquer acesso por parte de 3º. Garantnido a seguranção do usuario.'
    },
    {
      'doubt': 'Tive porblemas com o App!',
      'res':
          'Relate seus problemas através do nosso canal de comunicação na guia suporte!'
    },
    {
      'doubt': 'Porque tem Anúncios?',
      'res':
          'Para financiar a manutenção e futuras atualizaçõesdo do App, atualizações essas baseadas na sua necessidade.'
    },
    {
      'doubt': 'Como posso contribuir com o Projeto?',
      'res': 'Atravez dos anúncios ou por meio da sugestão de melhoria.'
    }
  ];
}

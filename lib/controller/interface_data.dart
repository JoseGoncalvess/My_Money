import 'package:flutter/material.dart';
import '../model/category_event.dart';
import '../model/payment_type.dart';

class InterfaceData {
  List<CategoryEvent> category = [
    CategoryEvent(name: 'Feria', icon: Icons.luggage_rounded),
    CategoryEvent(name: 'Lazer', icon: Icons.park_rounded),
    CategoryEvent(name: 'Investimento', icon: Icons.auto_graph_rounded),
    CategoryEvent(name: 'Viagem', icon: Icons.flight_rounded),
    CategoryEvent(name: 'Saúde', icon: Icons.medical_services_rounded),
    CategoryEvent(name: 'Trabalho', icon: Icons.work),
  ];

  List<PaymentType> paymentType = [
    PaymentType(name: 'Cartão', icon: Icons.credit_card_rounded),
    PaymentType(name: 'Dinehiro', icon: Icons.payments_rounded)
  ];
  List<String> months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Mail',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
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

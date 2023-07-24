class DateEvent {
  String getdate({required String date}) {
    var item = date.split('/');
    switch (item[1]) {
      case '01':
        return '${item[0]}/Janeiro';
      case '02':
        return '${item[0]}/Fevereiro';
      case '03':
        return '${item[0]}/Março';
      case '04':
        return '${item[0]}/Abril';
      case '05':
        return '${item[0]}/Mail';
      case '06':
        return '${item[0]}/Junho';
      case '07':
        return '${item[0]}/Julho';
      case '08':
        return '${item[0]}/Agosto';
      case '09':
        return '${item[0]}/Setembro';
      case '10':
        return '${item[0]}/Outubro';
      case '11':
        return '${item[0]}/Novembro';
      case '12':
        return '${item[0]}/Dezembro';
    }
    return date;
  }

  getMonth({required String date}) {
    var item = date.split('/');
    switch (item[1]) {
      case '01':
        return 'JAN';
      case '02':
        return 'FEV';
      case '03':
        return 'MARC';
      case '04':
        return 'ABR';
      case '05':
        return 'MAI';
      case '06':
        return 'JUN';
      case '07':
        return 'JUL';
      case '08':
        return 'AGO';
      case '09':
        return 'SET';
      case '10':
        return 'OUT';
      case '11':
        return 'NOV';
      case '12':
        return 'DEZ';
    }
    return '';
  }
}

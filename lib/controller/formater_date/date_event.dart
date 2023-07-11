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
}

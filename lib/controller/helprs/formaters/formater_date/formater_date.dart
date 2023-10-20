class FormaterDate {
  String fdata({required String dataTme}) {
    final List<String> data = dataTme.split(' ');
    final List<String> listdata = data[0].split('-');

    final dataformater = '${listdata[2]}/${listdata[1]}/${listdata[0]}';

    return dataformater;
  }
}

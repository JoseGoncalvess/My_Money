mixin ValidadorMixin {
  String? combvalidator({required List<String? Function()> validator}) {
    for (var func in validator) {
      // final validation = func();

      if (func() != null) return func();
    }
    return null;
  }

  String? isempyt({String? value, String? msg}) {
    if (value!.isEmpty) return msg ?? 'O campo precisa ser Pprenenchido';
    return null;
  }

  String? islengthMin(String? value, String? msg, int length) {
    if (value!.length < length)
      return msg ?? 'Acredio que o nome informado é pequeno, não ?';
    return null;
  }

  String? islengthMax(String? value, String? msg, int length) {
    if (value!.length > length)
      return msg ?? 'Acredio que o nome informado é pequeno, não ?';
    return null;
  }

  String? isContainNuber(String? value, String? msg) {
    final name = value!.split('');

    for (var item in name) {
      if (item.contains(RegExp(r'[0-9]'))) {
        return msg ?? 'VAmos lá, Ultilize apenas letras!';
      }
    }
    return null;
  }

  String? isContaintext(String? value, String? msg) {
    final name = value!.split('');

    for (var item in name) {
      if (item.contains(RegExp(r'[A-Z|a-z]'))) {
        return msg ?? 'Vamos lá, Ultilize apenas letras!';
      }
    }
    return null;
  }
}

mixin ValidadorMixin {
  isempyt(String? value, String? msg) {
    if (value!.isEmpty) return msg ?? 'O campo precisa ser Pprenenchido';
    return null;
  }

  islengthMin(String? value, String? msg) {
    if (value!.length < 2)
      return msg ?? 'Acredio que o nome informado é pequeno, não ?';
    return null;
  }

  String? combvalidator(List<String Function()> validators) {
    for (var func in validators) {
      final validation = func();
      // ignore: unnecessary_null_comparison
      if (validation != null) return validation;
    }
    return null;
  }
}

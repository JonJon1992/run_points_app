

import 'package:diacritic/diacritic.dart';

String sanitizerAcento(String value) {
  value = removeDiacritics(value);
  value = value.replaceAll('  ', ' ');
  value = value.replaceAll('\t', '');
  return value;
}

String sanitizerNumero(String value) {
  return value.replaceAll(RegExp(r'[^0-9]'), '');
}

String sanitizerTexto(String value) {
  value = value.replaceAll('  ', ' ');
  value = value.replaceAll('\t', ' ');
  value = value.replaceAll('\n', ' ');
  return value;
}

String removeHTML(value, [replaceTo = '']) {
  RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

  return value.replaceAll(exp, replaceTo);
}

String replaceStgUrl(String value) {
  return value.replaceFirst("-stg-cdn", "-cdn");
}

String replaceCdnTempUrl(String? value) {
  if (value == null) return "";
  return value.replaceFirst(
    "grancursosonline.s3.amazonaws.com",
    "assets.infra.grancursosonline.com.br",
  );
}

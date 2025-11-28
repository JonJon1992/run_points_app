import 'package:intl/intl.dart';

String realFormaterSimbol(String valor) {
  if (valor.isEmpty) return '';
  String valorFomart = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  ).format(double.parse(valor));
  return valorFomart;
}

String calcPercent(int numerador, int denominador) {
  return denominador <= 0
      ? '0%'
      : '${(numerador / denominador * 100).round()}%';
}

String doubleFormater(double n, {int precision = 0}) {
  return n
      .toStringAsFixed(n.truncateToDouble() == n ? 0 : precision)
      .replaceAll('.', ',');
}

String percentFormater(double value) {
  return NumberFormat.percentPattern('pt_BR').format(value);
}

String formatThousands(int value) =>
    NumberFormat.decimalPattern('pt_BR').format(value);

String customEllipsis(String text, {int? startLimiter, int? endLimiter}) {
  startLimiter = startLimiter ?? 37;
  endLimiter = endLimiter ?? 36;

  int totalLength = text.length;

  if (totalLength > (startLimiter + endLimiter)) {
    String startText = text.substring(0, startLimiter).trim();
    String endText = text
        .substring(totalLength - endLimiter, totalLength)
        .trim();

    text = '$startText... $endText';
  }

  return text;
}

String titleCase(String title) {
  return title
      .trim()
      .toLowerCase()
      .split(' ')
      .map((val) => '${val[0].toUpperCase()}${val.substring(1).toLowerCase()}')
      .join(' ');
}

String? substringCast(String? value) {
  if (value != null && value.length > 22) {
    return "${value.substring(0, 19)}...";
  }
  return value;
}

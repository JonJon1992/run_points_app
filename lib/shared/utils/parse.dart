import 'dart:math';

int onlyNumber(String value) {
  if (value.isEmpty) {
    return 0;
  }

  String onlyNumberStr = value.replaceAll(RegExp(r'[^0-9]'), '');
  return int.parse(onlyNumberStr);
}

int stringToInt(String value) {
  if (value.isEmpty) {
    return 0;
  }

  String onlyNumberStr = value.replaceAll(RegExp(r'[^0-9]'), '');

  if (onlyNumberStr.isEmpty) {
    return 0;
  }

  return int.parse(onlyNumberStr);
}

bool intToBool(int value) {
  return value == 1 ? true : false;
}

int boolToInt(bool value) {
  return value == true ? 1 : 0;
}

Duration stringToDuration(String? s) {
  if (s == null || s.isEmpty) {
    return Duration();
  }

  List<String> parts = s.split(':');

  int seconds = int.parse(parts.removeLast());
  int minutes = int.parse(parts.removeLast());
  int hours = parts.isEmpty ? 0 : int.parse(parts.removeLast());

  return Duration(hours: hours, minutes: minutes, seconds: seconds);
}

Duration parseDuration(String value) {
  int hours = 0;
  int minutes = 0;

  if (value.isEmpty) {
    return Duration(hours: hours, minutes: minutes);
  }

  List<String> parts = value.split(':');
  if (parts.length > 1) {
    hours = int.parse(parts[0]);
    minutes = int.parse(parts[1]);
  } else if (parts.isNotEmpty) {
    hours = int.parse(parts[0]);
  }
  return Duration(hours: hours, minutes: minutes);
}

DateTime stringToDate(String? value) {
  if (value == null) {
    return DateTime.now();
  }
  final split = value.split(' ');
  return DateTime.parse(split[0]);
}

double truncateToDecimalPlaces(num value, int fractionalDigits) =>
    (value * pow(10, fractionalDigits)).truncate() / pow(10, fractionalDigits);

double truncateToHundreths(num value) => (value * 100).truncate() / 100;

extension TruncateDoubles on double {
  double truncateToDecimalPlaces(int fractionalDigits) =>
      (this * pow(10, fractionalDigits)).truncate() / pow(10, fractionalDigits);
}

castValidator<T>(dynamic value, {T? defaultValue}) {
  try {
    if (value == null || value == '') {
      throw Exception('Valor para converter é nulo');
    }

    switch (T.toString()) {
      case 'String':
        value = value.toString();
        break;
      case 'int':
        value = int.tryParse(value.toString());
        break;
      case 'double':
        value = double.tryParse(value.toString());
        break;
      case 'bool':
        if (value is String) {
          if (value.toLowerCase() == 'true' || value.toLowerCase() == '1') {
            value = true;
          } else if (value.toLowerCase() == 'false' ||
              value.toLowerCase() == '0') {
            value = false;
          }
        } else if (value == 1 || value == true) {
          value = true;
        } else if (value == 0 || value == false) {
          value = false;
        } else {
          throw Exception('Valor para tipo boolean não reconhecido');
        }
        break;
      case 'DateTime':
        value = DateTime.parse(value.toString()).toLocal();
        break;
      case 'Duration':
        List<String> parts = value.split(':');
        if (parts.length < 2) {
          throw FormatException("Invalid duration format");
        }
        int hours = int.parse(parts[0]);
        int minutes = int.parse(parts[1]);
        double seconds = double.parse(parts[2]);
        value = Duration(
          hours: hours,
          minutes: minutes,
          seconds: seconds.toInt(),
        );
        break;
    }

    return value as T;
  } catch (_) {
    return defaultValue;
  }
}

DateTime? parseDateTime(String? value) {
  if (value != null) return DateTime.parse(value);
  return null;
}

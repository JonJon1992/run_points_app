import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String formatToPtBr({
  required String inputDateString,
  String format = 'dd/MM/yyyy',
  String input = 'yyyy-MM-dd HH:mm',
}) {
  if (inputDateString.isEmpty) {
    return '';
  }

  var inputFormat = DateFormat(input);
  var inputDate = inputFormat.parse(inputDateString);
  var outputFormat = DateFormat(format);
  return outputFormat.format(inputDate);
}

String formatDateTimeToLongPtBr({required DateTime date}) {
  final mes = DateFormat.MMMM(
    Get.locale.toString(),
  ).format(date).capitalizeFirst.toString();
  return "$mes, ${date.year}";
}

String formatDateToLongPtBr({
  required String value,
  String input = 'yyyy-MM-dd HH:mm:ss',
}) {
  var dateFormate = DateFormat(input);
  var dateTime = dateFormate.parse(value);
  var mes = DateFormat.MMMM(
    Get.locale.toString(),
  ).format(dateTime).capitalizeFirst.toString();
  return "${dateTime.day} de $mes";
}

String stringToDateTime({
  required String inputDateString,
  String format = "dd/MM/yyyy 'às' H'h'",
  String input = 'yyyy-MM-dd HH:mm:ss',
}) {
  if (inputDateString.isEmpty) {
    return '';
  }

  var inputFormat = DateFormat(input);
  var inputDate = inputFormat.parse(inputDateString);
  var outputFormat = DateFormat(format);
  return outputFormat.format(inputDate);
}

int daysBetween(DateTime from, DateTime to) {
  from = DateTime(from.year, from.month, from.day);
  to = DateTime(to.year, to.month, to.day);
  return (to.difference(from).inHours / 24).round();
}

Future<DateTime?> mostrarDatePicker(
  BuildContext context, {
  DateTime? date,
  DateTime? lastDate,
}) async {
  lastDate ??= DateTime(DateTime.now().year + 1, DateTime.now().month + 1, 0);

  return await showDatePicker(
    context: context,
    initialDate: date ?? DateTime.now(),
    firstDate: DateTime(2019),
    initialDatePickerMode: DatePickerMode.day,
    initialEntryMode: DatePickerEntryMode.calendarOnly,
    builder: (context, child) => child!,
    lastDate: lastDate,
  );
}

String dateDiffForHumans(DateTime date) {
  final difference = DateTime.now().difference(date);

  String result = '';

  if (difference.inSeconds < 60) {
    result =
        "Há ${difference.inSeconds} segundo${difference.inSeconds == 1 ? '' : 's'}";
  } else if (difference.inMinutes < 60) {
    result =
        "Há ${difference.inMinutes} minuto${difference.inMinutes == 1 ? '' : 's'}";
  } else if (difference.inHours < 24) {
    result =
        "Há ${difference.inHours} hora${difference.inHours == 1 ? '' : 's'}";
  } else {
    result = "Há ${difference.inDays} dia${difference.inDays == 1 ? '' : 's'}";
  }

  return result;
}

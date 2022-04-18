import 'package:intl/intl.dart';

String formatRawTime(int timeSubject) {
  if (timeSubject < 10) {
    return '0$timeSubject';
  } else {
    return timeSubject.toString();
  }
}

String formatDate(String date) {
  return DateFormat('dd.MM.yyyy').format(DateTime.parse(date));
}

String formatTime(String time) {
  return time.substring(0, 5);
}

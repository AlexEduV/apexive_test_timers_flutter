
import 'package:intl/intl.dart';

String getWeekDayFromDate(String date) {
  final List<String> array = date.split('.');

  if (array.length == 3) {
    final day = array.first;
    final month = array[1];
    final year = array[2];

    return DateFormat('EEEE').format(
      DateTime.parse('$year-$month-$day'),
    );
  }

  return '';
}

String getTodayDateString() {

  return DateFormat('dd.MM.yyyy').format(DateTime.now());
}

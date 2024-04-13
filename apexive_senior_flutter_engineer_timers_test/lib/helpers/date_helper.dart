
import 'package:intl/intl.dart';

String getWeekDayFromDate(String date)
{
  List<String> array = date.split('.');

  if (array.length == 3)
  {

    var day = array.first;
    var month = array[1];
    var year = array[2];

    return DateFormat('EEEE').format(
      DateTime.parse('$year-$month-$day'),
    );
  }

  return '';
}

String getTodayDateString()
{
  return DateFormat('dd.MM.yyyy').format(DateTime.now());
}

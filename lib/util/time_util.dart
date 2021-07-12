import 'package:intl/intl.dart';

String justTimeTxt(DateTime date) {
  return DateFormat.jm().format(date);
}

String displayDatesFormat(DateTime date) {
  return DateFormat.yMMMd('en_us').format(date);
}

String displayDatesWithTime(DateTime date) {
  // DateFormat f = DateFormat('jm mMMM dd, yyyy');
  var time = justTimeTxt(date);
  var localdate = displayDatesFormat(date);
  return '$time $localdate';
}

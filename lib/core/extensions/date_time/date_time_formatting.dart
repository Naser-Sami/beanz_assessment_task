import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String get formattedDate =>
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

  String get formattedTime =>
      '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';

  String get fullFormatted => '$formattedDate $formattedTime';

  // formattedDate: 2023-07-27
  String get formattedDateTime => DateFormat('yyyy-MM-dd').format(this);

  // format date as 10 Jul 2023
  String get formattedDateWithMonthName =>
      DateFormat('dd MMM yyyy').format(this);
}

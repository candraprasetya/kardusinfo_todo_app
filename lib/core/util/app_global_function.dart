// Format Date Time to Indonesian Format (dd MMMM yyyy)
import 'package:intl/intl.dart';

String formatDate(DateTime date) {
  return DateFormat('dd MMMM yyyy').format(date);
}

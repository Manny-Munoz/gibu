import 'package:intl/intl.dart';

String doubleToCurrency(double value) {
  return NumberFormat.currency(locale: 'en', symbol: '\$').format(value);
}

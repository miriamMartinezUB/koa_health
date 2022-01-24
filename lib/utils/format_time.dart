import 'package:flutter_translate/flutter_translate.dart';
import 'package:intl/intl.dart';

extension FormatTime on DateTime {
  String getFormattedDate() {
    final f = DateFormat.jm();
    return "${translate('month.${this.month.toString()}')} ${this.day}, ${this.year} ${f.format(this)}";
  }
}

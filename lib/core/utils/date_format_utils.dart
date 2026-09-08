import 'package:intl/intl.dart';

/// Date formatting shared by the editor's summary cards and the PDF
/// renderer's date-range text, so "Jan 2021 – Present" always reads
/// identically in both places.
abstract final class DateFormatUtils {
  static final DateFormat _monthYear = DateFormat('MMM yyyy');

  static String monthYear(DateTime date) => _monthYear.format(date);

  static String dateRange({
    required DateTime? start,
    required DateTime? end,
    required bool isCurrent,
  }) {
    final startText = start != null ? monthYear(start) : '';
    if (isCurrent) return '$startText – Present';
    final endText = end != null ? monthYear(end) : '';
    if (startText.isEmpty && endText.isEmpty) return '';
    return '$startText – $endText';
  }
}

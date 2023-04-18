import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

class DateTimeUtils {
  static bool isSameDay(DateTime date, DateTime sameDate) {
    return DateTime(date.year, date.month, date.day) == DateTime(sameDate.year, sameDate.month, sameDate.day);
  }

  static bool isToday(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    return DateTime(date.year, date.month, date.day) == today;
  }

  static bool isYesterday(DateTime date) {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    return DateTime(date.year, date.month, date.day) == yesterday;
  }

  static bool isTomorrow(DateTime date) {
    final now = DateTime.now();
    final yesterday = DateTime(now.year, now.month, now.day + 1);
    return DateTime(date.year, date.month, date.day) == yesterday;
  }

  static bool isCurrentYear(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year;
  }

  static String buildDateAndTimeString(DateTime dateTime) {
    return DateFormat('yyyy.MM.dd HH:mm').format(dateTime);
  }

  static String getFormattedTime(int seconds) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = seconds ~/ 60;
    int sec = seconds % 60;

    String parsedTime = "${getParsedTime(
      min.toString(),
    )} : ${getParsedTime(
      sec.toString(),
    )}";

    return parsedTime;
  }

  static int get dayInMillis => 24 * 60 * 60 * 1000;
}

String formatDate(DateTime? date) {
  if (date == null) {
    return '';
  }
  Jiffy day = Jiffy(date.toLocal());
  Jiffy today = Jiffy(DateTime.now().toLocal());

  if (day.yMd == today.yMd) {
    return 'Сегодня в ${day.Hm}';
  }
  if (day.yMd == today.add(days: -1).yMd) {
    return 'Вчера в ${day.Hm}';
  }
  return DateFormat('dd.MM.yyyy kk:mm').format(
    date.toLocal(),
  );
}

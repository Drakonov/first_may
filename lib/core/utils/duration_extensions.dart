extension DurationExtension on Duration {
  String getTimeString() {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String oneDigit(int n) {
      return "$n";
    }

    String oneDigitMinutes = oneDigit(
      inMinutes.remainder(60),
    );
    String twoDigitsMinutes = twoDigits(
      inMinutes.remainder(60),
    );
    String twoDigitSeconds = twoDigits(
      inSeconds.remainder(60),
    );
    if (inHours > 0) {
      return "${twoDigits(inHours)}:$oneDigitMinutes:$twoDigitSeconds";
    } else if (inMinutes >= 10) {
      return "$twoDigitsMinutes:$twoDigitSeconds";
    } else {
      return "$oneDigitMinutes:$twoDigitSeconds";
    }
  }
}

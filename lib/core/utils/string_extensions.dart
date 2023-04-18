extension StringExtensions on String {
  String removeTrailingZeros() {
    return replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
  }

  String toFirstUpperCase() {
    if (this == "" || length < 2) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

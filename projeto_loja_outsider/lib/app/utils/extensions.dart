extension StringExtension on String {
  String firstCharUpperCase() =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

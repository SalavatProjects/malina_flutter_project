extension StringExtension on String {
  String toCapitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
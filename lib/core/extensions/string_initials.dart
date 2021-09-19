extension Initials on String {
  String initials() {
    final d = this.split(" ");
    return "${d.first.substring(0, 1)}${d.last.substring(0, 1)}";
  }
}

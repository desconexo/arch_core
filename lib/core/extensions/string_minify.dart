extension Minify on String {
  String minify() {
    final d = this.split(" ");
    return "${d.first} ${d.last}";
  }
}

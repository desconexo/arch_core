class RouteBuilder {
  static String books = RoutePaths.books;
  static String search = "${RoutePaths.books}${RoutePaths.search}";
}

class RoutePaths {
  static String books = "/books";
  static String search = "/search";
}
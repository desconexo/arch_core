class RouteBuilder {
  static String books() => RoutePaths.books;
  static String search(String? bookId) =>
      "${RoutePaths.books}${bookId == null ? RoutePaths.bookInfo : '/$bookId'}";
}

class RoutePaths {
  static String books = "/books";
  static String bookInfo = "/:bookId";
}
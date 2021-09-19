import 'package:architecture_core/architecture_core.dart';
import 'package:example/modules/books/pages/books_home.dart';
import 'package:example/modules/books/pages/books_search.dart';
import 'package:example/modules/books/router/route_names.dart';

class BooksRouter extends RouterObject {
  BooksRouter() : super(RoutePaths.books, BooksHome(),
      children: <RouterObject>[
        RouterObject(RoutePaths.search, BooksSearch()),
      ]);
}
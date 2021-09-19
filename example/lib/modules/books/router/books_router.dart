import 'package:architecture_core/architecture_core.dart';
import 'package:example/modules/books/bindings/book_info_binding.dart';
import 'package:example/modules/books/bindings/books_home_binding.dart';
import '../presentation/pages/books_home.dart';
import '../presentation/pages/book_info.dart';
import 'package:example/modules/books/router/route_names.dart';

class BooksRouter extends RouterObject {
  BooksRouter() : super(RoutePaths.books, BooksHome(), binding: BooksHomeBinding(),
      children: <RouterObject>[
        RouterObject(RoutePaths.bookInfo, BookInfo(), binding: BookInfoBinding()),
      ]);
}
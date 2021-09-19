import 'package:architecture_core/architecture_core.dart';

class BooksDataSource extends HttpService {
  BooksDataSource() : super("books/v1/volumes");
}
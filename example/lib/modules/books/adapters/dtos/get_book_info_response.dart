import 'package:architecture_core/architecture_core.dart';
import 'package:example/modules/books/entities/book.dart';

class GetBookInfoResponse extends DTO<Book> with Listfy {

  @override
  Book toObject(Map<String, dynamic> response) {
    return Book(
      title: response["volumeInfo"]["title"],
      cover: response["volumeInfo"]["imageLinks"]["medium"],
      authors: toList<String>(response["volumeInfo"]["authors"]),
      pageCount: response["volumeInfo"]["pageCount"],
      description: response["volumeInfo"]["description"],
    );
  }
}
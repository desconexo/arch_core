import 'package:architecture_core/architecture_core.dart';
import 'package:example/modules/books/entities/book_brief.dart';

class GetBooksResponse extends DTO<List<BookBrief>> with Listfy {
  @override
  List<BookBrief> toObject(Map<String, dynamic> response) {
    final List<Map<String, dynamic>> items = toList<Map<String, dynamic>>(response["items"]);

    return items.map<BookBrief>((map) =>
        BookBrief(
          id: map["id"],
          title: map["volumeInfo"]["title"],
          cover: map["volumeInfo"]["imageLinks"]["smallThumbnail"],
        )).toList();
  }
}
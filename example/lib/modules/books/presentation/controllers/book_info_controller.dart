import 'package:dartz/dartz.dart';
import 'package:example/modules/books/adapters/books_repository_adapter.dart';
import 'package:example/modules/books/entities/book.dart';
import 'package:example/modules/books/user_stories/get_book_data_us.dart';
import 'package:get/get.dart';

class BookInfoController extends GetxController {
  final GetBookDataUS _getBookDataUS = GetBookDataUS(BooksRepositoryAdapter());
  final String bookId;
  final Rx<Book?> _book = Rx<Book?>(null);

  BookInfoController(this.bookId) : assert(bookId != "", "bookId must not be empty");

  Book? get book => _book.value;
  Stream<Book?> get stream => _book.stream;

  @override
  void onInit() {
    super.onInit();

    _getBookDataUS(bookId).then((response) {
      if(response.isRight())
        _book.value = (response as Right).value;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
import 'package:dartz/dartz.dart';
import 'package:example/modules/books/adapters/books_repository_adapter.dart';
import 'package:example/modules/books/entities/book_brief.dart';
import 'package:example/modules/books/user_stories/get_books_us.dart';
import 'package:get/get.dart';

class BooksHomeController extends GetxController {
  final GetBooksUS _getBooksUS = GetBooksUS(BooksRepositoryAdapter());
  RxList<BookBrief> books = <BookBrief>[].obs;

  BooksHomeController() {
    _getBooksUS().then((response) {
      if(response.isRight())
        books.value = (response as Right).value;
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
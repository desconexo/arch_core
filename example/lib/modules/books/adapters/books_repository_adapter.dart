import 'package:architecture_core/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:example/modules/books/adapters/dtos/get_books_response.dart';
import 'package:example/modules/books/data_sourcers/books_data_source.dart';
import 'package:example/modules/books/entities/book.dart';
import 'package:example/modules/books/entities/book_brief.dart';
import 'package:example/modules/books/repository/books_repository.dart';

import 'dtos/get_book_info_response.dart';

class BooksRepositoryAdapter extends BooksRepository {
  final BooksDataSource _dataSource = BooksDataSource();

  @override
  Future<Either<Failure, List<BookBrief>>> getBooks() async {
    return await _dataSource.findByQuery<List<BookBrief>>(
        dto: GetBooksResponse(),
        query: {"q": "books"},
    );
  }

  @override
  Future<Either<Failure, Book>> getBook({String? bookId}) async {
    return await _dataSource.findById<Book>(
      path: "/$bookId",
      dto: GetBookInfoResponse(),
    );
  }

}